class RemoveCreatorIdFromRatings < ActiveRecord::Migration
  def up
    remove_column :ratings, :creator_id
  end

  def down
  	add_column :ratings, :creator_id, :integer
  end
end
