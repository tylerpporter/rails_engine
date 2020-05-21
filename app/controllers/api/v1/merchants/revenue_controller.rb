class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    merchants = Merchant.by_revenue(params[:quantity])
    render json: MerchantSerializer.new(merchants)
  end

  def show
    @revenue = Merchant.revenue(params[:id])
    render '/merchants/revenue/show.json'
  end
end
