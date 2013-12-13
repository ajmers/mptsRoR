class ActivitiesController < ApplicationController

	def new
		@activity = current_user.activities.new(params.permit(:content))
	end

	def create
		@activity = current_user.activities.build(params.require(:activity).permit(:content))
		if @activity.save
			flash[:success] = "Activity created!"
			redirect_to @activity
		end
	end 

	def show
		@user = current_user
		@activities = @user.activities.paginate(page: params[:page], :per_page => 10)
	end

	def index
		@user = current_user
		@activities = @user.activities.paginate(page: params[:page], :per_page => 10)
	end

	private

		def activity_params
			params.require(:activity).permit(:content)
		end

end
