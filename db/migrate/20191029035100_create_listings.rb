class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.boolean :bundle
      t.string :title
      t.integer :gender
      t.text :description
      t.float :price
      t.references :category, foreign_key: true
      t.references :size, foreign_key: true
      t.references :brand, foreign_key: true
      t.float :rating
      t.boolean :sold_status
      t.integer :rating_score
      t.boolean :rated_status

      t.timestamps
    end
  end
end
