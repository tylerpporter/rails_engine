class Merchant < ApplicationRecord
  include Filterable

  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy

  scope :by_name, lambda { |name|
    where('lower(name) LIKE ?', "%#{name}%")
      .or(where('upper(name) LIKE ?', "%#{name}%"))
  }
  scope :by_created_at, ->(created_at) { where created_at: created_at }
  scope :by_updated_at, ->(updated_at) { where updated_at: updated_at }
end
