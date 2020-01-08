class LikeQuestion < ApplicationRecord
    belongs_to :user
    belongs_to :question

    def date
        self.created_at.to_date
    end
end
