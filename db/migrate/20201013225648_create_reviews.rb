class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :date
      t.integer :rating
      t.string :comment
      t.integer :movie_id
    end
  end
end
