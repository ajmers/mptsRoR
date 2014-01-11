class RatingsController < ApplicationController

	def new
		@user = current_user
		@activities = Activity.not_rated_by(@user).order(created_at: :desc)
		@activity = @activities.first
		@rating = Rating.new
	end

	def create
		activity_id = params[:activity_id]
		activity = Activity.find(activity_id)
		activity_creator = User.find(activity.user_id)
		@rating = Rating.new(:rating =>params[:rating][:rating], :rater_id => current_user.id, :activity_id => activity_id)
		if @rating.save
			flash[:success] = "Rating saved!"
			activity.update_score_and_number_ratings!
			activity_creator.update_user_points!
			redirect_to rate_path
		end
	end

	def index
		@user = current_user
		@activities = Activity.not_rated_by(@user).paginate(page: params[:page], :per_page => 10).order(created_at: :desc)
		@activity = @activities.first
		@rating = @activity.ratings.new()
	end

	def show
	end

end