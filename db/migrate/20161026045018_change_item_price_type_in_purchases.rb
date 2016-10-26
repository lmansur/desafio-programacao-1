class ChangeItemPriceTypeInPurchases < ActiveRecord::Migration[5.0]
  def change
    change_column :purchases, :item_price, :big_decimal
  end
end
