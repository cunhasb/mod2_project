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

  def new
    @user = User.new
  end

  # move to likes_controller?
  def like
    current_user.add_like(params[:user])
    redirect_to user_path(current_user)
  end

  def log_in
  end

  def log_user_in
    user = User.find_by(name: params[:user][:name])
    if user.authenticate(params[:user][:password])
      current_user = user
      redirect_to users_path
    else
      render :log_in
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
