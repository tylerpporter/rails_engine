class MerchantRevenueSerializer
  include FastJsonapi::ObjectSerializer
  attribute :revenue do |merchant|
    merchant.revenue.to_f
  end 
end
