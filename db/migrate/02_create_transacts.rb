class CreateTransacts < ActiveRecord::Migration[5.1]
  def change
    create_table :transacts do |t|
      t.boolean :we_buy
      t.integer :size
      t.decimal :price
      t.integer :bond_id
      t.integer :client_id
      t.integer :trader_id
      t.datetime :trade_time


      t.timestamps
    end
  end
end