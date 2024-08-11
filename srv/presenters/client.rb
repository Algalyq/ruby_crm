module Presenters
    class Client 
        def initialize(params)
            @username = params.fetch("username")
        end 
    
        def call
            UseCases::Client.new(username: @username).call
        end 
    end 
end