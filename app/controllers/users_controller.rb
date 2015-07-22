class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # Automatically load the view in /views/users/show.html.erb
  end
end
