class RenameContentToCommentInReviews < ActiveRecord::Migration
  def change
    rename_column :reviews, :content, :comment
  end
end
