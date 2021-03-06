class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # Automatically load the view in /views/users/show.html.erb
  end

  # Processes the edit user form submission
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to "/users" # redirect needs a request path
    else
      # rendering needs a specific view template to show
      # erb :"users/edit" => Sinatra equivalent
      render "edit" # "users" folder is assumed
    end
  end

  # Get the form to edit a user
  def edit
    @user = User.find(params[:id])
  end

  # Get the form to create the user
  def new
    @user = User.new
    # Automatically load the view in /views/users/new.html.erb
  end

  # Processes the new user form submission
  def create
    @user = User.new(user_params)
    # {name: params[:name], password: params[:password]}
      if @user.save
        redirect_to "/users" # redirection needs a request path
        # rendering needs a specific view template to show.
      else
        render "new" # users folder is assumed
      end
  end

  # utility methods
  private

  def user_params
    # strong parameters
    params[:user].permit(:name, :password)
  end
end
