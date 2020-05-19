require 'rails_helper'

describe 'Searching for a single record' do
  scenario 'it can return the correct merchant' do
    create_list(:merchant, 5)
    merchant = Merchant.first
    merchant2 = Merchant.last

    get "/api/v1/merchants/find?name=#{merchant.name.downcase[0..2]}"

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp[:data][:attributes][:id]).to eq(merchant.id)

    get "/api/v1/merchants/find?created_at=#{merchant2.created_at}"

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp[:data][:attributes][:id]).to eq(merchant2.id)
  end
  scenario 'it can return the correct merchant when multiple conditions need to be met' do
    merchant1 = Merchant.create(name: 'Dog', created_at: Faker::Time.backward(days: 5, period: :evening))
    merchant2 = Merchant.create(name: 'Dog', created_at: Faker::Time.backward(days: 30, period: :evening))

    expect(merchant1.created_at).to_not eq(merchant2.created_at)

    get "/api/v1/merchants/find?name=dog&created_at=#{merchant1.created_at}"

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp[:data][:attributes][:id]).to eq(merchant1.id)
  end
end
