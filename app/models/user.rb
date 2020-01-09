class User < ApplicationRecord

    validates :name, length: { minimum: 6 }
    validates :username, length: { minimum: 6 }, format: { with: /\A[a-zA-Z0-9-_.]+\Z/, message:"can't have any spaces or special characters, except for dashes or dots" }, uniqueness: true
    validates :email, format: {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: {message:"already belongs to an existing account"}
    validates :password, presence: true, length: { in: 6..50 }, format: { without: /\s/ }, :on => :create
    validates :password, presence: true, length: { in: 6..50 }, format: { without: /\s/ }, :on => :update, :unless => lambda{ |user| user.password.to_s.empty? }
    has_secure_password

    has_many :questions
    has_many :answers
    has_many :like_questions
    has_many :like_answers    

    has_many :follower_connections, foreign_key: :following_id, class_name: "Connection"
    has_many :followers, through: :follower_connections, source: :follower

    has_many :following_connections, foreign_key: :user_id, class_name: "Connection"
    has_many :following, through: :following_connections, source: :following

    def self.find_or_create_by_omniauth(auth)
        where(uid: auth['uid']).first_or_create do |u|
            u.name = auth['info']['name'] ? auth['info']['name'] : auth['info']['nickname']
            u.username = u.generate_username
            u.email = auth['info']['email']
            u.image = auth['info']['image']
            u.password = SecureRandom.hex
            u.provider = auth['provider']
        end
    end

    def liked
        self.like_questions + self.like_answers
    end

    def to_param
        username
    end

    def name
        self[:name].split.map(&:capitalize).join(' ') unless self[:name].nil?
    end

     def generate_username
        username = ActiveSupport::Inflector.transliterate(self.name) # change ñ => n
        .downcase              # only lower case
        .strip                 # remove spaces around the string
        .gsub(/[^a-z]/, '_')   # any character that is not a letter or a number will be _
        .gsub(/\A_+/, '')      # remove underscores at the beginning
        .gsub(/_+\Z/, '')      # remove underscores at the end
        .gsub(/_+/, '_')       # maximum an underscore in a row

        find_unique_username(username)
    end

    def find_unique_username(username)
        user = User.find_by(username:username)
        unless user
            username
        else
            count = 0
            while true do
                new_username = "#{username}_#{count}"
                return new_username unless User.find_by(username:new_username)
                count += 1
            end
        end
    end
end
