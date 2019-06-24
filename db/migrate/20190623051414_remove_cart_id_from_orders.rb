class RemoveCartIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :cart_id, :integer
    remove_column :orders, :shopping_address, :string
    remove_column :orders, :another_address_id, :string
    add_column :orders, :address_id, :integer
  end
end
