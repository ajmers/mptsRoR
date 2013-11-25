class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :content
      t.integer :numTimesRanked
      t.decimal :avgScore
      t.integer :user_id

      t.timestamps
    end
  end
end
