class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.string :purchaser_name
      t.string :item_desc
      t.float :item_price
      t.integer :purchase_count
      t.string :merchant_addr
      t.string :merchant_name

      t.timestamps
    end
  end
end
