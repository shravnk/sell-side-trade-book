class AddPendingColumn <  ActiveRecord::Migration[5.1]
  def change
    add_column :transacts, :pending, :boolean
  end
end