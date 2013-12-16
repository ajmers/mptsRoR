class Activity < ActiveRecord::Base
	belongs_to :user
	has_many :ratings, dependent: :destroy

	def self.not_rated(user)
		where('user_id !=? AND NOT EXISTS (SELECT 1 FROM ratings WHERE ratings.activity_id = activities.id AND ratings.rater_id = ?)', user.id, user.id)	
	end

end
