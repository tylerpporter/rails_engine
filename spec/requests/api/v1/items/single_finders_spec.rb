require 'rails_helper'

describe 'Searching for a single record' do
  scenario 'it can return the correct item with partial attribute match' do
    merchant = create(:merchant)
    create_list(:item, 3, merchant_id: merchant.id)
    item_params = {
      name: "The Dude",
      description: "Lifesize Jeff Bridges doll",
      unit_price: "20000.00",
      merchant_id: merchant.id
    }
    item = merchant.items.create(item_params)

    get '/api/v1/items/find?name=dude'

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp[:data][:attributes][:id]).to eq(item.id)

    get '/api/v1/items/find?description=jeff'

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp[:data][:attributes][:id]).to eq(item.id)
  end
  scenario 'it can return the correct item when multiple conditions need to be met' do
    merchant = create(:merchant)
    create_list(:item, 2, merchant_id: merchant.id)
    item1_params = {
      name: "The Dude",
      description: "Lifesize Jeff Bridges doll",
      unit_price: "20000.00",
      merchant_id: merchant.id
    }
    item2_params = {
      name: "The Dude",
      description: "Oversized Jeff Bridges plush toy",
      unit_price: "20.50",
      merchant_id: merchant.id
    }
    item1 = merchant.items.create(item1_params)
    item2 = merchant.items.create(item2_params)

    get '/api/v1/items/find?name=dude&unit_price=20.50'

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp[:data][:attributes][:id]).to eq(item2.id)
  end
end
