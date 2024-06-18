class RemoveImageFromPhotos < ActiveRecord::Migration[7.1]
  def change
    remove_column :photos, :image, :binary
  end
end
