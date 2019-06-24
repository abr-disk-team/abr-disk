class AddPaymentToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :payment, :string
  end
end
