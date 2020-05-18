require 'rails_helper'

describe 'API - Merchants resource' do
  it 'sends an index of all merchants' do
    create_list(:merchant, 5)
    get '/api/v1/merchants'

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants[:data].size).to eq(5)
  end
  it 'sends one merchant by id' do
    create_list(:merchant, 5)
    merchant = Merchant.last

    get "/api/v1/merchants/#{merchant.id}"

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp[:data][:attributes][:id]).to eq(merchant.id)
    expect(resp[:data][:type]).to eq("merchant")
    expect(resp[:data][:attributes][:name]).to eq(merchant.name)
  end
  it 'can create a merchant' do
    body = {
      "name": "Bobby's Shop Of Hops"
    }

    post '/api/v1/merchants', params: body

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp[:data][:attributes][:id]).to be_present
    expect(resp[:data][:attributes][:name]).to eq(body[:name])
  end

end
