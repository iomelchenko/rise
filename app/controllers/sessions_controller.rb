class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_name(params[:name])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.user_id
  		redirect_to admin_url
  	else
  	    redirect_to login_url, alert: "Your login or password incorrect"
  	end	
  end

  def destroy
  end
end
