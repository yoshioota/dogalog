class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.integer :rating
      t.boolean :in_public

      t.timestamps null: false
    end
  end
end
