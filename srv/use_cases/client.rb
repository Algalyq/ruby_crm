module UseCases
    class Client 
        def initialize(username: )
            @username = username 
        end 
        
        def call 
            user_status = Models::Client.fetch_status
            user_status.where("username = ?", @username)
        end 
    end 
end 