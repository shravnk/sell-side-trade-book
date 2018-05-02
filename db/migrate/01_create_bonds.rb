class CreateBonds < ActiveRecord::Migration[5.1]
  def change
    create_table :bonds do |t|
      t.string :isin
      t.string :ticker
      t.decimal :coupon
      t.date :maturity
      t.datetime :trade_date

      t.timestamps
    end
  end
end