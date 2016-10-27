class AddColumnTotalRevenueToImport < ActiveRecord::Migration[5.0]
  def change
    add_column :imports, :total_revenue, :decimal
  end
end
