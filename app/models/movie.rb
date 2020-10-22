class Movie < ActiveRecord::Base
    belongs_to :user
    has_many :reviews
    validates_presence_of :title, :genre, :release_year, :director, :description
    validates_uniqueness_of :title
end