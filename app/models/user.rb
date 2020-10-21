class User < ActiveRecord::Base
    has_many :movies
    has_many :reviews, through: :movies
    has_secure_password
    validates :username, presence: true, uniqueness: true
end