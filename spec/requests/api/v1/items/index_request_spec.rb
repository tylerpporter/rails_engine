require 'rails_helper'

describe 'Items API' do
  it 'sends an index of all items' do
    merchant = create(:merchant)
    create_list(:item, 5, merchant_id: merchant.id)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[:data].size).to eq(5)
    expect(items[:data].sample[:attributes][:merchant_id]).to eq(merchant.id)
  end
end
