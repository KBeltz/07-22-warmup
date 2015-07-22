class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # Automatically load the view in /views/users/show.html.erb
  end

  # Get the form to create the user
  def new
    @user = User.new
    # Automatically load the view in /views/users/new.html.erb
  end

  def create

  end
end
