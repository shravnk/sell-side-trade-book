class AddUsernameColumn <  ActiveRecord::Migration[5.1]
  def change
    add_column :traders, :username, :string
    add_column :salespeople, :username, :string
  end
end