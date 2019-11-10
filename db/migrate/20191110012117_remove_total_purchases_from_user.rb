class RemoveTotalPurchasesFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :total_purchases, :float
  end
end
