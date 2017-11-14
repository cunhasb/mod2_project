class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def sign_up
    @user = User.new(user_params)
    if @user.save
      redirect_to "/index"
    else
      render :sign_up
    end
  end

  def like
    current_user.add_like(params[:user])
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
    params.require(:users).permit(:name, :password)
  end

end
