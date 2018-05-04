class CreateSalespersonTransacts < ActiveRecord::Migration[5.1]
  def change
    create_table :salesperson_transacts do |t|
      t.integer :salesperson_id
      t.integer :transact_id
      
      t.timestamps
    end
  end
end