class AddRepasswordToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :repassword, :string
  end
end
