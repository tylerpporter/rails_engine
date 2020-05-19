class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  def total_price
    unit_price * quantity 
  end
end
