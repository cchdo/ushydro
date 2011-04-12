class SessionsController < ApplicationController
  layout "standard"
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to '/staff/events', :notice => "Logged in!"
    else
      flash[:warning] = "Invalid email or password"
      render "new"
    end
  end
end
