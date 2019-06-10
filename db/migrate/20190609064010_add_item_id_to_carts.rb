class AddItemIdToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :item_id, :integer
  end
end
