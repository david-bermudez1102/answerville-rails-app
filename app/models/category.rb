class Category < ApplicationRecord
    has_many :question_categories
    has_many :questions, through: :question_categories

    def name
        self[:name].split.map(&:capitalize).join(' ') unless self[:name].nil?
    end
end
