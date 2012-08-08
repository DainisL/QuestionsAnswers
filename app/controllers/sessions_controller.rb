class SessionsController < ApplicationController
 
 before_filter :current_user
  
  def new
   end
  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user
  		session[:user_id] = user.id
  		redirect_to root_url, :notice => "Logged in!"
  	else
  		flash.new.alter = "Invalid email or password"
      render "new"

    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out"
  end
end
