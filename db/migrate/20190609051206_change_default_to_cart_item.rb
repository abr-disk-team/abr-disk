class ChangeDefaultToCartItem < ActiveRecord::Migration[5.2]
  def change
    change_column :cart_items, :quantity, :integer, default: '0'
  end
end
