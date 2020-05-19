class Api::V1::Merchants::MostRevenueController < ApplicationController
  def index
    merchants = Merchant.by_revenue(params[:quantity])
    render json: MerchantSerializer.new(merchants)
  end
end
