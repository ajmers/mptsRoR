class RenameNumTimesRankedColumn < ActiveRecord::Migration
  def up
    rename_column :activities, :numTimesRanked, :num_times_ranked
  end

  def self.down
    rename_column :activities, :num_times_ranked, :numTimesRanked
  end

end
