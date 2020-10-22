class Review < ActiveRecord::Base
    belongs_to :movie
    belongs_to :user
    validates_presence_of :date, :rating, :comment
end