class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Session.bypass_login(session, @user)
      redirect_to root_path, notice: "Welcome, #{@user.username}!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user)
      .permit(:username, :password, :password_confirmation, :accepts_terms_of_use)
  end
end
