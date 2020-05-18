require 'rails_helper'

describe 'API - Merchants resource' do
  it 'returns the item ids associated with a merchant' do
    merchant = create(:merchant)
    create_list(:item, 5, merchant_id: merchant.id)
    expected_ids = merchant.items.map(&:id)

    get "/api/v1/merchants/#{merchant.id}/items"

    resp = JSON.parse(response.body, symbolize_names: true)

    item_ids = resp[:data].map { |item| item[:id].to_i }

    expect(item_ids).to eq(expected_ids)
  end
end
