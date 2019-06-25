class RemoveCartItemIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :cart_item_id, :integer
  end
end
