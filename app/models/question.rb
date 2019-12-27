class Question < ApplicationRecord
    belongs_to :user
    has_many :answers, dependent: :delete_all
    has_many :likes, class_name: "LikeQuestion", dependent: :delete_all
    has_many :question_categories
    has_many :categories, through: :question_categories

    def categories_attributes=(category_attributes)
        category_attributes.values.each do |category_attribute|
            category = Category.find_or_create_by(category_attribute) unless category_attribute[:name].blank?
            self.categories << category unless category_attribute[:name].blank?
        end
    end

end
