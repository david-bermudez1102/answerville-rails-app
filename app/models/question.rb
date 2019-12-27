class Question < ApplicationRecord
    belongs_to :user
    has_many :answers, dependent: :delete_all
    has_many :likes, class_name: "LikeQuestion", dependent: :delete_all
    has_many :category_questions
    has_many :categories, through: :category_questions
end
