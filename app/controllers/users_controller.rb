class UsersController < ApplicationController
  def index
    @users = current_user.matches_only_no_score
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "🍧 successful sign up!"
      Profile.create(user_id: current_user.id)
      Preference.create(user_id: current_user.id)
      current_user.add_profile
      current_user.add_preference(params[:preference_check])

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
      session[:user_id]= current_user.id
      redirect_to users_path
    else
      render :log_in
    end
  end

  def show
    @user = User.find(params[:id])
  end


  def edit
    if logged_in?
      @user= current_user
    else
      redirect_to '/log_in'
    end

  end

  def update
    current_user.update(user_params)
    if current_user.errors.any?
      render :edit
    else
    redirect_to user_path
  end
  end

  def destroy
    current_user.destroy
    redirect_to users_path
  end

  def like_user
    current_user.add_like(params[:id])
    @user = current_user.id
    redirect_to user_path(current_user)
  end

  def unlike
    current_user.unlike(params[:id])
    redirect_to user_path(current_user)
    end




  private


  def user_params
    params.require(:user).permit(:name, :password, :email, :avatar)

  end
end
