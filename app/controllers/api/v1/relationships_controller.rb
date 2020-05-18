class Api::V1::RelationshipsController < ApplicationController
  def index
    merchant = Merchant.find(params[:id])
    render json: ItemSerializer.new(merchant.items.all)
  end

  def show
    merchant_id = Item.find(params[:id]).merchant_id
    render json: MerchantSerializer.new(Merchant.find(merchant_id))
  end
end
