class Revenue
  class << self
    def total_revenue(start_date, end_date)
      Invoice.joins(:invoice_items, :transactions)
      .merge(Transaction.successful)
      .where(created_at: start_date..end_date)
      .sum('quantity * unit_price')
    end
  end
end
