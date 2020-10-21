class AddUserIdToReviewsJoinTableRemoveNameColumn < ActiveRecord::Migration
  def change
    add_column :reviews, :user_id, :integer
    add_column :reviews, :username, :string
  end
end
