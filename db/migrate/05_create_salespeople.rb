class CreateSalespeople < ActiveRecord::Migration[5.1]
  def change
    create_table :salespeople do |t|
      t.string :name
      
      t.timestamps
    end
  end
end