# srv/endpoints/http_endpoints/dwh_transactions.rb
require_relative '../../models/application_record'
Dir[File.join(__dir__, '../../models/*.rb')].sort.each { |file| require file }
Dir[File.join(__dir__, '../../use_cases/*.rb')].sort.each { |file| require file }
# Load all presenters
Dir[File.join(__dir__, '../../presenters/*.rb')].sort.each { |file| require file }

module HttpEndpoints
  class Transactions < Grape::API
    version 'v1', using: :path
    format :json

    namespace :user do
      post :history do
        # Pass the extracted parameters to the presenter
        response = Presenters::Transactions.new(params).call
        present response
      end

      post :status do
        # Pass the extracted parameters to the presenter
        response = Presenters::Client.new(params).call
        present response
      end
    end

  end
end
