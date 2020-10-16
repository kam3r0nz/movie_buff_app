class User < ActiveRecord::Base
    has_many :movies
    has_many :reviews, through: :movies
    has_secure_password
end