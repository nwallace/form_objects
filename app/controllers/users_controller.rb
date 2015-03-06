class UsersController < ApplicationController

  def new
    @user = SignUp.new
  end

  def create
    @user = SignUp.new(sign_up_params)
    if @user.save
      Session.bypass_login(session, @user.user)
      redirect_to root_path, notice: "Welcome, #{@user.username}!"
    else
      render :new
    end
  end

  private

  def sign_up_params
    params.require(:user)
      .permit(:username, :password, :password_confirmation, :terms_of_use)
  end
end
