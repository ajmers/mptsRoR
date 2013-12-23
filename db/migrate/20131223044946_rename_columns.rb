class RenameColumns < ActiveRecord::Migration
  def up
    rename_column :activities, :avgScore, :avg_score
    rename_column :users, :pointsWon, :points_won
    rename_column :users, :partipPoints, :partic_points
  end

  def self.down
    rename_column :activities, :avg_score, :avgScore
    rename_column :users, :points_won, :pointsWon
    rename_column :users, :partic_points, :partipPoints
  end

end
