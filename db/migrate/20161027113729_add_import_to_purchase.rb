class AddImportToPurchase < ActiveRecord::Migration[5.0]
  def change
    add_reference :purchases, :import, foreign_key: true
  end
end
