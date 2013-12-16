class RatingsController < ApplicationController

	def new
		@activity = Activity.find(params[:activity_id])
		@rating = @activity.ratings.create(params[:rating].permit(:rating))
	end

	def create
		@activity = Activity.find(params[:activity_id])
		@rating = @activity.ratings.create(params[:rating].permit(:rating))
	end

	def index
	end

	def show
	end

end
