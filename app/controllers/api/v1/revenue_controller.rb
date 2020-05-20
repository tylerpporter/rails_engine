class Api::V1::RevenueController < ApplicationController
  def show
    @revenue = Revenue.total_revenue(params[:start], params[:end])
    render '/revenue/show.json'
  end
end
