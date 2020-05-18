require 'rails_helper'

describe 'API - Merchants resource' do
  it 'sends an index of all merchants' do
    create_list(:merchant, 5)
    get '/api/v1/merchants'

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants[:data].size).to eq(5)
  end

end
