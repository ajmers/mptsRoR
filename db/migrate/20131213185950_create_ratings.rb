class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :activity_id
      t.integer :creator_id
      t.integer :rater_id
      t.integer :rating

      t.timestamps
    end
    add_index :ratings, :activity_id
    add_index :ratings, :creator_id
    add_index :ratings, :rater_id
    add_index :ratings, [:activity_id, :rater_id], unique: true
  end
end
