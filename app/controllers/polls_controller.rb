class PollsController < ApplicationController

  before_action :ensure_logged_in, only: [:new, :create]

  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    if @poll.save
      redirect_to polls_path, notice: "Poll created successfully."
    else
      render :new
    end
  end

  def destroy
    Poll.find(params[:id]).destroy!
    redirect_to polls_path, notice: "Poll deleted successfully."
  end

  private

  def poll_params
    params.require(:poll)
          .permit(:question, choices_attributes: [:text, :_destroy])
          .merge(created_by: current_user)
  end
end
