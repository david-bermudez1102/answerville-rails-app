class Answer < ApplicationRecord
    validates :content, length: { in: 8..500 }

    belongs_to :user
    belongs_to :question
    has_many :likes, class_name:"LikeAnswer", dependent: :delete_all

    def liked?(user)
        self.likes.find_by(user:user)
    end

    def type
        "answer"
    end
end
