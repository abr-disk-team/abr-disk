class RemoveItemIdFromCarts < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :item_id, :integer
  end
end
