class RemoveSellerFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :seller, :boolean
  end
end
