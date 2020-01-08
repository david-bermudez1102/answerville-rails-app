class LikeAnswer < ApplicationRecord
    belongs_to :user
    belongs_to :answer

    def date
        self.created_at.to_date
    end
end
