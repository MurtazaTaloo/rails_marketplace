class RemoveRatingFromListing < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :rating, :float
  end
end
