class MerchantRevenueSerializer
  include FastJsonapi::ObjectSerializer
  attribute :revenue do |merchant|
    merchant.total_revenue.to_f
  end
end
