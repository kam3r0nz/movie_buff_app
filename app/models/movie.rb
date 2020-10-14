class Movie < ActiveRecord::Base
    has_many :reviews, through: :users
    belongs_to :user
end