module Models 
    class Reg_Transactions_V01 < ApplicationRecord
      self.table_name = 'merchant_receipt_processor.reg_transactions_v01'
      self.primary_key = 'document_id'  # Specify the primary key if it's not `id`
      
      has_one :merchant_receipt_applied, class_name: 'Models::MerchantReceiptApplied', foreign_key: 'id'
    end
  
    class Transactions 
      def self.fetch_data 
        Reg_Transactions_V01
          .joins(:merchant_receipt_applied)
          .select(
            'merchant_receipt_applied.status',
            'reg_transactions_v01.*',
          )
          
      end


    end
  end
  