class RemoveTotalSalesFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :total_sales, :float
  end
end
