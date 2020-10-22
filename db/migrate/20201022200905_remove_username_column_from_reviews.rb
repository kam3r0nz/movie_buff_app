class RemoveUsernameColumnFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :username
  end
end
