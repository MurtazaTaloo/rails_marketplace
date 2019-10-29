class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :seller, :boolean
    add_column :users, :rating, :float
    add_column :users, :name, :string
    add_column :users, :address, :text
    add_column :users, :total_sales, :float
    add_column :users, :total_transactions, :integer
    add_column :users, :total_purchases, :float
    add_column :users, :rating_score_total, :integer
  end
end
