# srv/presenters/transactions.rb
module Presenters
    class Transactions
      def initialize(params)
        @username = params.fetch("username")
        @date_from = params.fetch("date_from")
        @date_to = params.fetch("date_to")
      end
  
      def call
        UseCases::Transactions.new(username: @username, date_from: @date_from, date_to: @date_to).call
      end
    end
end
  