class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.decimal :unit_price
      t.references :merchant, foreign_key: true
      t.string :created_at
      t.string :updated_at
    end
  end
end
