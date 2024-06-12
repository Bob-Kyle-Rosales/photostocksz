class CreatePhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.string :category
      t.integer :likes
      t.binary :image
      t.string :timestamps

      t.timestamps
    end
  end
end
