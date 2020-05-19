class Merchant < ApplicationRecord
  include Filterable

  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  scope :by_name, ->(name) { where('lower(name) LIKE ?', "%#{name.downcase}%")}
  scope :by_created_at, ->(created_at) { where created_at: created_at }
  scope :by_updated_at, ->(updated_at) { where updated_at: updated_at }

  class << self
    def by_revenue(limit)
      select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue')
        .joins(:invoices, :invoice_items, :transactions)
        .merge(Transaction.successful)
        .group(:id)
        .order("total_revenue DESC")
        .limit(limit)
    end
  end

end
