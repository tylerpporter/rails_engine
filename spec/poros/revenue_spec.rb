require 'rails_helper'

describe Revenue do
  describe 'class methods' do
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
      create_list(:invoice, 2, merchant_id: @merchant1.id, customer_id: @customer.id, created_at: '2012-03-08')
      create_list(:invoice, 2, merchant_id: @merchant2.id, customer_id: @customer.id, created_at: '2012-03-10')
      create_list(:invoice, 2, merchant_id: @merchant3.id, customer_id: @customer.id, created_at: '2012-03-12')
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
    it 'total_revenue' do
      revenue = Revenue.total_revenue('2012-03-09', '2012-03-14').to_f

      expect(revenue).to eq(68.85)
    end
  end
end
