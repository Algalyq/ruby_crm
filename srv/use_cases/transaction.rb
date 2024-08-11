module UseCases
    class Transactions
      def initialize(username: , date_from: , date_to:)
        @username = username
        @date_from = date_from
        @date_to = date_to
      end 
      
      def call
        user_transactions = Models::Transactions.fetch_data
        user_transactions.where("src_account_name = ?", @username)
                         .where("real_receipt_ts >= ?", @date_from)
                         .where("real_receipt_ts < ?", @date_to)
      end 
    end 
end 

    