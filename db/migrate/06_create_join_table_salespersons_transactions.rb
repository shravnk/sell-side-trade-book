class CreateSalespersonsTransactionsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :salespersons, :transactions do |t|
      t.index :salesperson_id
      t.index :transaction_id
      
      t.timestamps
    end
  end
end