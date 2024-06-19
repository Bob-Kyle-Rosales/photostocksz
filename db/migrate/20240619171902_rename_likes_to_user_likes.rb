class RenameLikesToUserLikes < ActiveRecord::Migration[7.1]
  def change
    rename_table :likes, :user_likes
  end
end
