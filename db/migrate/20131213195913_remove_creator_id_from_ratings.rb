class RemoveCreatorIdFromRatings < ActiveRecord::Migration
  def down
    remove_column :ratings, :creator_id
  end

  def up
  	add_column :ratings, :creator_id, :integer
  end
end
