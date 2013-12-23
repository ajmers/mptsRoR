class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
										format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 } 
	
	has_many :activities, dependent: :destroy

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def self.update_user_points(user_id)
		ranked_activities = Activity.where("user_id = :user_id AND num_times_ranked >= 1", {user_id: user_id})
		user_average = ranked_activities.average(:avg_score)
		activity_creator = User.find(user_id)
		activity_creator.update_attribute(:points_won, user_average)
	end

	private

	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end

end
