class Api::V1::Items::SearchController < ApplicationController
  def show
    items = Item.filter(search_params)
    render json: ItemSerializer.new(items.first)
  end

  private

  def search_params
    params.permit(:name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

end
