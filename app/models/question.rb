class Question < ApplicationRecord
    validates :content, length: { in: 15..140 }
    validates :categories, presence: true

    belongs_to :user
    has_many :answers, dependent: :delete_all
    has_many :likes, class_name: "LikeQuestion", dependent: :delete_all
    has_many :question_categories
    has_many :categories, through: :question_categories

    def categories_attributes=(category_attributes)
        category_attributes.values.each do |category_attribute|
            category_attribute = capitalized_categories(category_attribute)
            category = Category.find_or_create_by(category_attribute) unless category_attribute[:name].blank?
            self.categories << category unless category_attribute[:name].blank?
        end
    end

    def liked?(user)
        self.likes.find_by(user:user)
    end

    def type
        "question"
    end

    def content
        if self[:content]
            self[:content] << "?" unless self[:content].include?("?")
        end
        self[:content]
    end

    private
        def capitalized_categories(category_attribute)
            category_attribute.each do |attribute,value|
                category_attribute[attribute] = value.downcase
            end
        end

end
