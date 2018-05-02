class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :type	
      t.integer :size
      t.decimal :price
      t.integer :bond_id
      t.integer :client_id
      t.integer :trader_id



      t.timestamps
    end
  end
end