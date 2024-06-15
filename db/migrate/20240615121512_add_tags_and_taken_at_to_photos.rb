class AddTagsAndTakenAtToPhotos < ActiveRecord::Migration[7.1]
  def change
    add_column :photos, :tags, :string
    add_column :photos, :taken_at, :datetime
  end
end
