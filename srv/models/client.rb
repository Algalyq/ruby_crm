module Models 
    class LoyaltyClient < ApplicationRecord
        self.table_name = 'loyalty.client'

        has_one :client_achievement, class_name: 'Models::ClientAchievement', foreign_key: 'client_id'

    end 


    class Client 
        def self.fetch_status 
            LoyaltyClient
                .joins(client_achievement: :achievement)
                .select(
                    'client.username',
                    'achievement.code'

                )
                .order('achievement.code desc')
                .limit(1)
        end
    end 
end  
    
    