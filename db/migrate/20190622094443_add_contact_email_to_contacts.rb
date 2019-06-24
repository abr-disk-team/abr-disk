class AddContactEmailToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :contact_email, :string
  end
end
