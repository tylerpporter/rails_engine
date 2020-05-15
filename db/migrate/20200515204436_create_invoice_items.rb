class CreateInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_items do |t|
      t.integer :quantity
      t.decimal :unit_price
      t.string :created_at
      t.string :updated_at
      t.references :item, foreign_key: true
      t.references :invoice, foreign_key: true
    end
  end
end
