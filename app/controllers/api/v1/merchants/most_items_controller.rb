class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    merchants = Merchant.by_items(params[:quantity])
    render json: MerchantSerializer.new(merchants)
  end
end
