class Review < ActiveRecord::Base
    belongs_to :movie # this movie owns the review
    belongs_to :user # made review
    validates_presence_of :date, :rating, :comment
end