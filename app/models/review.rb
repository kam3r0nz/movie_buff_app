class Review < ActiveRecord::Base
    belongs_to :movie
    belongs_to :user
    validates_presence_of :rating
end