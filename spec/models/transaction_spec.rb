require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'relationships' do
    it { should belong_to :invoice}
  end

  describe 'class methods' do
    it 'successful' do
      merchant = create(:merchant)
      customer = create(:customer)
      invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
      trans1 = create(:transaction, result: 'success', invoice_id: invoice.id)
      trans2 = create(:transaction, result: 'success', invoice_id: invoice.id)
      trans3 = create(:transaction, result: 'failed', invoice_id: invoice.id)
      trans4 = create(:transaction, result: 'success', invoice_id: invoice.id)
      trans5 = create(:transaction, result: 'failed', invoice_id: invoice.id)

      successfuls = Transaction.successful

      expect(successfuls.size).to eq(3)
      expect(successfuls.sample.class).to eq(Transaction)
      expect(successfuls).to_not include(trans3)
      expect(successfuls).to include(trans1)
    end
  end
end
