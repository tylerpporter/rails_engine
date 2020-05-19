class Item < ApplicationRecord
  include Filterable

  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items

  scope :by_name, lambda { |name|
    where('lower(name) LIKE ?', "%#{name}%")
      .or(where('upper(name) LIKE ?', "%#{name}%"))
  }
  scope :by_description, lambda { |desc|
    where('lower(description) LIKE ?', "%#{desc}%")
      .or(where('upper(description) LIKE ?', "%%#{desc}"))
  }
  scope :by_unit_price, ->(price) { where unit_price: price }
  scope :by_merchant_id, ->(merchant_id) { where merchant_id: merchant_id }
  scope :by_created_at, ->(created_at) { where created_at: created_at }
  scope :by_updated_at, ->(updated_at) { where updated_at: updated_at }
end
