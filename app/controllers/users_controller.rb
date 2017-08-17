class UsersController < ApplicationController
  
	def new

	end

  def index

  end

  def create

  	birthday = params[:user][:birthday_day] + "/" + params[:user][:birthday_month] + "/" + params[:user][:birthday_year]
		@user = User.new(email: params[:user][:email], first_name: params[:user][:first_name], last_name: params[:user][:last_name], password: params[:user][:password], birthday: birthday.to_date)
  		
  	result = @user.check_age

  	if result
  		@user.save
  		sign_in(@user)
  		redirect_to "/users"
  	else
  		render "new"
  	end

  end

  def edit
    @user = User.find(params[:id])
    byebug
  end

  def update
    byebug
    @user= User.find(params[:id])
    
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path

  end
end
