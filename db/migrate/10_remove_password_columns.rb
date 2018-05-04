class RemovePasswordColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :traders, :password_digest
    remove_column :salespeople, :password_digest
  end
end