class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :price
      t.integer :stock
      t.text :jacket_image_id
      t.integer :genre_id
      t.integer :artist_id
      t.integer :label_id
      t.string :cd_name
      t.timestamps
    end
  end
end