class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "🍧 successful sign up!"
      redirect_to users_path
    else
      flash[:notice] = "🦉 Not a valid user!!"
      render :new
    end
  end

  # move to likes_controller?
  def like
    current_user.add_like(params[:user])
  end

  def new
    @user = User.new
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
