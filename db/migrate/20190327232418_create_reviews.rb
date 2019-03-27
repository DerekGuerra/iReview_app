class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :rating
      t.string :comment
      t.integer :user_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
