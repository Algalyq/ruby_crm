require 'grape'
require_relative 'http_endpoints/dwh_transactions'
require_relative 'http_endpoints/system'
require_relative '../presenters/transactions'
require_relative '../use_cases/transaction'
require_relative '../models/transactions'
require_relative '../models/application_record'
require_relative '../models/mra'

class SrvApi < Grape::API
  mount HttpEndpoints::System
  mount HttpEndpoints::Transactions
  
end
