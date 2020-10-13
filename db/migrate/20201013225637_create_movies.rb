class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.integer :release_year
      t.string :director
      t.string :description
      t.integer :user_id
    end
  end
end
