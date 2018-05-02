class CreateSalespeopleTransactsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :salespeople, :transacts do |t|
      t.index :salesperson_id
      t.index :transact_id
      
      t.timestamps
    end
  end
end