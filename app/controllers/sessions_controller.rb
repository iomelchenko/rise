# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
    skip_before_filter :authorise
  def new
  end

  def create
  	user = User.find_by_name(params[:name])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to admin_url
  	else
  	    redirect_to login_path, alert: "Your login or password incorrect"
  	end	
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to store_index_path, notice: "Session is ended"
  end
end
