class Revenue
  class << self
    def total_revenue(start_date, end_date)
      Invoice.joins(:invoice_items, :transactions)
      .merge(Transaction.successful)
      .where(created_at: date_range(start_date, end_date))
      .sum('quantity * unit_price')
    end

    private

    def date_range(start_date, end_date)
      Date.parse(start_date).beginning_of_day...Date.parse(end_date).end_of_day
    end
  end
end
