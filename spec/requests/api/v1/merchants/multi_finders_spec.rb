require 'rails_helper'

describe 'Searching for multiple records' do
  scenario 'it can return all merchants that match the criteria' do
    create_list(:merchant, 3, name: "Jimbo")
    create_list(:merchant, 2, name: "Johnny")

    get '/api/v1/merchants/find_all?name=jim'

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp[:data].size).to eq(3)
  end
end
