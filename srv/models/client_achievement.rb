module Models 
    class ClientAchievement < ApplicationRecord
        self.table_name = 'loyalty.client_achievement'
        belongs_to :achievement, class_name: 'Models::Achievement', foreign_key: 'achievement_id'
    end
end 