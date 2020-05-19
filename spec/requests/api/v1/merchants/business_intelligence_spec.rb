require 'rails_helper'

describe 'API - Merchants resource' do
  before :each do
    @customer = create(:customer)
    create_list(:merchant, 3)
    @merchant1 = Merchant.all[0]
    @merchant2 = Merchant.all[1]
    @merchant3 = Merchant.all[2]
    create_list(:item, 2, merchant_id: @merchant1.id, unit_price: "2.55")
    create_list(:item, 2, merchant_id: @merchant2.id, unit_price: "2.55")
    create_list(:item, 2, merchant_id: @merchant3.id, unit_price: "2.55")
    @item1 = @merchant1.items.first
    @item2 = @merchant1.items.last
    @item3 = @merchant2.items.first
    @item4 = @merchant2.items.last
    @item5 = @merchant3.items.first
    @item6 = @merchant3.items.last
    create_list(:invoice, 2, merchant_id: @merchant1.id, customer_id: @customer.id)
    create_list(:invoice, 2, merchant_id: @merchant2.id, customer_id: @customer.id)
    create_list(:invoice, 2, merchant_id: @merchant3.id, customer_id: @customer.id)
    @invoice1 = @merchant1.invoices.first
    @invoice2 = @merchant1.invoices.last
    @invoice3 = @merchant2.invoices.first
    @invoice4 = @merchant2.invoices.last
    @invoice5 = @merchant3.invoices.first
    @invoice6 = @merchant3.invoices.last
    @transaction1 = create(:transaction, invoice_id: @invoice1.id, result: 'failure')
    @transaction2 = create(:transaction, invoice_id: @invoice2.id)
    @transaction3 = create(:transaction, invoice_id: @invoice3.id)
    @transaction4 = create(:transaction, invoice_id: @invoice4.id)
    @transaction5 = create(:transaction, invoice_id: @invoice5.id)
    @transaction6 = create(:transaction, invoice_id: @invoice6.id)
    @invoice_item1 = create(:invoice_item, item_id: @item1.id, invoice_id: @invoice1.id, unit_price: @item1.unit_price, quantity: 5)
    @invoice_item2 = create(:invoice_item, item_id: @item2.id, invoice_id: @invoice2.id, unit_price: @item2.unit_price, quantity: 4)
    @invoice_item3 = create(:invoice_item, item_id: @item3.id, invoice_id: @invoice3.id, unit_price: @item3.unit_price, quantity: 9)
    @invoice_item4 = create(:invoice_item, item_id: @item4.id, invoice_id: @invoice4.id, unit_price: @item4.unit_price, quantity: 8)
    @invoice_item5 = create(:invoice_item, item_id: @item5.id, invoice_id: @invoice5.id, unit_price: @item5.unit_price, quantity: 6)
    @invoice_item6 = create(:invoice_item, item_id: @item6.id, invoice_id: @invoice6.id, unit_price: @item6.unit_price, quantity: 4)
  end
  it 'can return a variable number of merchants ranked by total revenue' do
    get '/api/v1/merchants/most_revenue?quantity=2'

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp[:data].size).to eq(2)

    merchant1 = resp[:data].first
    merchant2 = resp[:data].last

    expect(merchant1[:attributes][:name]).to eq(@merchant2.name)
    expect(merchant2[:attributes][:name]).to eq(@merchant3.name)
  end
  it 'can return a variable number of merchants ranked by total number of items sold' do
    get '/api/v1/merchants/most_items?quantity=2'

    resp = JSON.parse(response.body, symbolize_names: true)

    merchant1 = resp[:data].first
    merchant2 = resp[:data].last

    expect(merchant1[:attributes][:name]).to eq(@merchant2.name)
    expect(merchant2[:attributes][:name]).to eq(@merchant3.name)
  end
end
