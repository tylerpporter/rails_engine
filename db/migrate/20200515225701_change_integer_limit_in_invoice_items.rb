class ChangeIntegerLimitInInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    change_column :invoice_items, :quantity, :integer, limit: 8
  end
end
