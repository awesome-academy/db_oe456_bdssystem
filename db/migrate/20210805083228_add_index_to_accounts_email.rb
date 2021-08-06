class AddIndexToAccountsEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :accounts, :email, unique: true
  end
end
