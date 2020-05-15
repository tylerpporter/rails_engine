require 'rails_helper'
require './db/csv/sales_engine.rb'

RSpec.describe Customer, type: :model do
  it 'can create customers' do
    customer_csv = SalesEngine.csv_hash[:customers]

    customer_csv.each do |row|
      Customer.create(row.to_h)
    end
    require "pry"; binding.pry
  end
end
