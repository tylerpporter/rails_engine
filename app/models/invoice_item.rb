class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
  has_many :transactions, through: :invoice

  class << self
    def total_revenue(start_date, end_date)
      joins(:transactions)
      .merge(Transaction.successful)
      .where(created_at: start_date..end_date)
      .sum('quantity * unit_price')
    end
  end
end
