require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :merchant}
    it { should have_many(:invoice_items).dependent(:destroy) }
    it { should have_many(:invoices).through(:invoice_items) }
  end

  describe 'class methods' do
    before :each do
      @merchant = create(:merchant)
      create_list(:item, 3, merchant_id: @merchant.id)
      @item_params = {
        name: "The Dude",
        description: "Lifesize Jeff Bridges doll",
        unit_price: "20000.00",
        merchant_id: @merchant.id,
        created_at: '2020-3-19',
        updated_at: '2020-3-20',
      }
      @the_dude = @merchant.items.create(@item_params)
    end
    it 'by_name' do
      item = Item.by_name('dude')

      expect(item.first).to eq(@the_dude)
    end
    it 'by_description' do
      item = Item.by_description('eff')

      expect(item.first).to eq(@the_dude)
    end
    it 'by_unit_price' do
      item = Item.by_unit_price("20000.00")

      expect(item.first).to eq(@the_dude)
    end
    it 'by_created_at' do
      item = Item.by_created_at('2020-3-19')

      expect(item.first).to eq(@the_dude)
    end
    it 'by_updated_at' do
      item = Item.by_updated_at('2020-3-20')

      expect(item.first).to eq(@the_dude)
    end
  end
end
