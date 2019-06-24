class AddCartItemIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cart_item_id, :integer
  end
end
