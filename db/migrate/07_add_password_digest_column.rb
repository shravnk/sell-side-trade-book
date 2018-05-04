class AddPasswordDigestColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :traders, :password_digest, :string
    add_column :salespeople, :password_digest, :string
  end
end