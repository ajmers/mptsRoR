class ActivitiesController < ApplicationController

	def new
		@activity = current_user.activities.new
	end

	def create
		@activity = current_user.activities.build(params.require(:activity).permit(:content))
		if @activity.save
			flash[:success] = "Activity created!"
			redirect_to @activity
		end
	end 

	def show
		@activity = Activity.find(params[:id])
		@user = current_user
	end

	def index
		@user = current_user
		@activities = @user.activities.paginate(page: params[:page], :per_page => 10).order(created_at: :desc)
	end

	def destroy
		@activity = Activity.find(params[:id])
		@activity.destroy
		redirect_to activities_path
		
	end

	def not_rated
		@user = current_user
		@activities = Activity.not_rated(current_user).paginate(page: params[:page], :per_page => 10).order(created_at: :desc)
		@rating = Rating.new
	end



	private

		def activity_params
			params.require(:activity).permit(:content)
		end

end
