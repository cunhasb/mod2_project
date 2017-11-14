class SessionsController < ApplicationController
  # change names to new and create?
  def log_in
  end

  def log_user_in
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      current_user = @user
      flash[:notice] = "all logged in and stuff!! 🦊"
      redirect_to users_path
    else
      flash[:notice] = "🌭 bad login"
      render :log_in
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
