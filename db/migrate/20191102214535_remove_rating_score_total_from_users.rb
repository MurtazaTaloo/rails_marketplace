class RemoveRatingScoreTotalFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :rating_score_total, :integer
  end
end
