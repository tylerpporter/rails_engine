class Api::V1::RevenueController < ApplicationController
  def show
    @revenue = InvoiceItem.total_revenue(params[:start], params[:end])
    render '/revenue/show.json'
  end
end
