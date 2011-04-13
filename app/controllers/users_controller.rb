class UsersController < ApplicationController
  layout "standard"
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to '/staff/events', :notice => "Signed up!"
    else
      render "new"
    end
  end
end

