module Filterable
  extend ActiveSupport::Concern
  
  module ClassMethods
    def filter(search_params)
      results = self.where(nil)
      search_params.each do |attr, value|
        results = results.public_send("by_#{attr}", value)
      end
      results
    end
  end
end
