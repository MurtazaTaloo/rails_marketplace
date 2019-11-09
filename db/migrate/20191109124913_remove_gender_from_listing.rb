class RemoveGenderFromListing < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :gender, :boolean
  end
end
