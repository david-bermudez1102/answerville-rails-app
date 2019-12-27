class Answer < ApplicationRecord
    belongs_to :user
    belongs_to :question
    has_many :likes, class_name:"LikeAnswer", dependent: :delete_all
end
