module Models 
    class MerchantReceiptApplied < ApplicationRecord
        self.table_name = 'merchant_receipt_processor.merchant_receipt_applied'
    
        # Association
        belongs_to :reg_transaction, class_name: 'Models::Reg_Transactions_V01', foreign_key: 'document_id'
      end
    end