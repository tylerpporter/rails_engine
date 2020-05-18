class Api::V1::RelationshipsController < ApplicationController
  def index
    # render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

  def show
    merchant_id = Item.find(params[:id]).merchant_id
    render json: MerchantSerializer.new(Merchant.find(merchant_id))
  end
end
