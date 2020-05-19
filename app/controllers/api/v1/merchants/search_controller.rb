class Api::V1::Merchants::SearchController < ApplicationController
  def show
    merchants = Merchant.filter(search_params)
    render json: MerchantSerializer.new(merchants.first)
  end

  private

  def search_params
    params.permit(:name, :created_at, :updated_at)
  end
end
