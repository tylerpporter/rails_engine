class MerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name

  attribute :revenue do |merchant|
    merchant.total_revenue.to_f
  end
end
