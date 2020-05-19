class Merchant < ApplicationRecord
  include Filterable

  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy

  scope :by_name, ->(name) { where('lower(name) LIKE ?', "%#{name.downcase}%")}
  scope :by_created_at, ->(created_at) { where created_at: created_at }
  scope :by_updated_at, ->(updated_at) { where updated_at: updated_at }

  class << self
    def by_revenue(limit)
      limit = limit.to_i - 1
      all.sort_by(&:total_revenue).reverse[0..limit]
    end
  end

    def total_revenue
      item_ids = items.map(&:id)
      invoice_items = InvoiceItem.where(item_id: item_ids)
      invoice_items.sum(&:total_price)
    end

end
