class RemoveTotalTransactionsFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :total_transactions, :integer
  end
end
