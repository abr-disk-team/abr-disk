class AddAnotherAddressIdToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :another_address_id, :integer
  end
end
