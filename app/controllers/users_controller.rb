class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:user_create_error] = "Error registering"
      render :new
    end
  end

  def new
  end

  def show
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless current_user.id == @user.id
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      redirect_to user_path(user)
    else
      flash[:user_update_error] = "Error updating"
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
    redirect_to edit_user_path(current_user) unless current_user.id == @user.id
  end

  def destroy
    User.find(session[:user_id]).destroy
    reset_session
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
