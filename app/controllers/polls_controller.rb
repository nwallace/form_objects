class PollsController < ApplicationController

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

  private

  def poll_params
    params.require(:poll).permit(:question)
  end
end
