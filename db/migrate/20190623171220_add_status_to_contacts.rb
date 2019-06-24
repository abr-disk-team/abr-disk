class AddStatusToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :status, :string, default: "未対応"
  end
end
