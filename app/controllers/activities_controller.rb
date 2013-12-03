class ActivitiesController < ApplicationController

	def new
		@activity = Activity.new
	end

	def create
		@user = User.find(params[:user_id])
	end 

	def show
	end

	def index
	end

end
