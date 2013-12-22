class Activity < ActiveRecord::Base
	belongs_to :user
	has_many :ratings, dependent: :destroy

	def self.not_rated(user)
		where('user_id !=? AND NOT EXISTS (SELECT 1 FROM ratings WHERE ratings.activity_id = activities.id AND ratings.rater_id = ?)', user.id, user.id)	
	end

	def self.update_score_and_num_ratings(activity_id)
		average = Rating.where(activity_id: activity_id).average(:rating)
		count = Rating.where(activity_id: activity_id).count
		activity = Activity.find(activity_id)
		activity.update(:numTimesRanked => count, :avgScore => average)
	end

end
