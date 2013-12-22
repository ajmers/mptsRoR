class RatingsController < ApplicationController

	def new
		@user = current_user
		@activities = Activity.not_rated(current_user).order(created_at: :desc)
		@activity = @activities.first
		@rating = Rating.new
	end

	def create
		activity_id = params[:activity_id]
		@rating = Rating.new(:rating =>params[:rating][:rating], :rater_id => current_user.id, :activity_id => activity_id)
		if @rating.save
			flash[:success] = "Rating saved!"
			Activity.update_score_and_num_ratings(activity_id)
			redirect_to rate_path
		end
	end

	def index
		@activities = Activity.not_rated(current_user).paginate(page: params[:page], :per_page => 10).order(created_at: :desc)
		@activity = @activities.first
		@rating = @activity.ratings.new()
	end

	def show
	end

end