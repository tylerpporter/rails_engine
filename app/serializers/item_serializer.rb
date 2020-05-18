class ItemSerializer
  include FastJsonapi::ObjectSerializer
  set_type :item
  attributes :id, :name, :description, :merchant_id

  attribute :unit_price do |item|
    item.unit_price.to_f
  end
end
