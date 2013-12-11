class ActivitiesController < ApplicationController

	def new
		@activity = Activity.new
	end

	def create
		@activity = current_user.activities.build(params.require(:activity).permit(:content))
		if @activity.save
			flash[:success] = "Activity created!"
			redirect_to activities_path
		end
	end 

	def show
	end

	def index
		@activity = current_user.activities.new(params.permit(:content))
	end

	private

		def activity_params
			params.require(:activity).permit(:content)
		end

end
