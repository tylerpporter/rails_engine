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
  it 'can create an item' do
    merchant = create(:merchant)
    body = {
      "name": "toy",
      "description": "fun toy",
      "unit_price": "10.50",
      "merchant_id": "#{merchant.id}"
    }

    expect(merchant.items.size).to eq(0)

    post '/api/v1/items', params: body

    item = JSON.parse(response.body, symbolize_names: true)

    expect(item[:data][:type]).to eq("item")
    expect(item[:data][:attributes][:id]).to be_present
    expect(item[:data][:attributes][:name]).to eq(body[:name])
    expect(item[:data][:attributes][:description]).to eq(body[:description])
    expect(item[:data][:attributes][:unit_price]).to eq(body[:unit_price].to_f)
    expect(item[:data][:attributes][:merchant_id]).to eq(merchant.id)

    merchant.reload

    expect(merchant.items.size).to eq(1)
  end
  it 'can update an item' do
    merchant = create(:merchant)
    create_list(:item, 5, merchant_id: merchant.id)
    og_item = merchant.items.last
    body = {
      "name": "toy",
      "description": "fun toy",
      "unit_price": "10.50",
      "merchant_id": "#{merchant.id}"
    }
    patch "/api/v1/items/#{og_item.id}", params: body

    updated_item = JSON.parse(response.body, symbolize_names: true)

    merchant.reload

    expect(updated_item[:data][:attributes][:id]).to eq(og_item.id)
    expect(updated_item[:data][:attributes][:name]).to eq(body[:name])
    expect(updated_item[:data][:attributes][:description]).to eq(body[:description])
    expect(updated_item[:data][:attributes][:unit_price]).to eq(body[:unit_price].to_f)
    expect(updated_item[:data][:attributes][:merchant_id]).to eq(merchant.id)
  end
  it 'can destroy an item' do
    merchant = create(:merchant)
    create_list(:item, 5, merchant_id: merchant.id)
    item = merchant.items.last

    delete "/api/v1/items/#{item.id}"

    merchant.reload
    deleted_item = JSON.parse(response.body, symbolize_names: true)

    expect(deleted_item[:data][:attributes][:id]).to eq(item.id)
    expect(merchant.items.size).to eq(4)
  end
end
