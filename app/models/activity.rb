class Activity < ActiveRecord::Base
	belongs_to :user
	has_many :ratings, dependent: :destroy

scope :not_rated_by, lambda {|user| where("user_id !=? AND NOT EXISTS (SELECT 1 FROM ratings WHERE ratings.activity_id = activities.id AND ratings.rater_id = ?)", user.id, user.id) }

def update_score_and_number_ratings!
  update(num_times_ranked: ratings.count, avg_score: ratings.average(:rating))
end

end
