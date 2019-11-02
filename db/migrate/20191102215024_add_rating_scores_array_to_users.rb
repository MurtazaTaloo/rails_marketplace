class AddRatingScoresArrayToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rating_scores_array, :integer, array: true, default: []
  end
end
