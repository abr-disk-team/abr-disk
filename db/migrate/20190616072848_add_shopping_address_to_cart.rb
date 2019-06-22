class AddShoppingAddressToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :shopping_address, :string
  end
end
