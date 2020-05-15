require 'rails_helper'
require './db/csv/model_generator.rb'

RSpec.describe Customer, type: :model do
  xit 'can create models' do
    csv_hash = SalesEngine.csv_hash
    ModelGenerator.create_models(csv_hash)
    require "pry"; binding.pry
  end
end
