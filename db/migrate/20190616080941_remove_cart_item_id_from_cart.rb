class RemoveCartItemIdFromCart < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :cart_item_id, :integer
    remove_column :carts, :quantity, :integer
    remove_column :carts, :item_id, :integer

  end
end
