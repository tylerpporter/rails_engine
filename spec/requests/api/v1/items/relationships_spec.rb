require 'rails_helper'

describe 'API - Items resource' do
  it 'returns the merchant associated with an item' do
    merchant = create(:merchant)
    create_list(:item, 5, merchant_id: merchant.id)
    item = Item.last

    get "/api/v1/items/#{item.id}/merchant"

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp[:data][:id].to_i).to eq(merchant.id)
  end
end
