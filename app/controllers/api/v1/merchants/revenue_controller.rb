class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    merchants = Merchant.by_revenue(params[:quantity])
    render json: MerchantSerializer.new(merchants)
  end

  def show
    merchant = Merchant.revenue(params[:id]).first
    render json: MerchantRevenueSerializer.new(merchant)
  end
end
