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
  it 'sends one item by id' do
    merchant = create(:merchant)
    create_list(:item, 5, merchant_id: merchant.id)
    item_id = merchant.items.last.id
    get "/api/v1/items/#{item_id}"


    item = JSON.parse(response.body, symbolize_names: true)
    expect(item[:data][:id]).to eq(item_id.to_s)
    expect(item[:data][:type]).to eq("item")
    expect(item[:data][:attributes][:unit_price].class).to eq(Float)
  end
end
