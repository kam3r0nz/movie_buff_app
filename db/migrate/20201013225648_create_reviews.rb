class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.datetime :date
      t.integer :rating
      t.string :content
      t.integer :movie_id
    end
  end
end
