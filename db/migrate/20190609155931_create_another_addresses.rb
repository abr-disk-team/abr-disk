class CreateAnotherAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :another_addresses do |t|
      t.integer :user_id
      t.string :another_last_name
      t.string :another_first_name
      t.string :another_last_name_kana
      t.string :another_first_name_kana
      t.string :address_name
      t.string :another_postcode
      t.string :another_prefecture
      t.string :another_city
      t.string :another_block
      t.string :another_building

      t.timestamps
    end
  end
end
