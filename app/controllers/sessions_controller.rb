class SessionsController < ApplicationController

  def new
    @session = session = Session.new(session)
  end

  def create
    @session = Session.new(session, session_params)
    if @session.valid?
      @session.authenticate!
      redirect_to root_url, notice: "Welcome, #{@session.username}."
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Goodbye!"
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
