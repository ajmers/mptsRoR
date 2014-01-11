class SessionsController < ApplicationController
	skip_before_filter :require_login

def new
end

def create
	user = User.find_by(email: params[:session][:email].downcase)
	if user && user.authenticate(params[:session][:password])
		user.update_user_points!
		sign_in user
		# Sign the user in and redirect to the user's show page.
	else
		#Create an error message and re-render the signin form.
		flash.now[:error]= "Invalid email/password combination!"
		render 'new'
	end
end

	def destroy
		sign_out
		redirect_to root_url
	end

end
