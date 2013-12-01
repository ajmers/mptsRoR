class UsersController < ApplicationController

skip_before_filter :require_login, :only=>[:new, :create] 

def new
	@user = User.new
end

def create
	@user = User.new(user_params)
	if @user.save
		sign_in @user
		flash[:success] = "Welcome to ManPts!"
		redirect_to @user
	else
		render 'new'
	end
end

def show
	@user = User.find(params[:id])
end

def index
end


private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
