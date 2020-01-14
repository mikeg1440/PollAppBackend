class Api::V1::PollsController < ApplicationController

  def index
    polls = Poll.all
    render json: polls, status: 200
  end

  def create
    poll = Poll.create(poll_params)
    render json: poll, status: 200
  end

  def show
    poll = Poll.find_by(id: params[:id])
    render json: poll, status: 200
  end

  private

  def poll_params
    params.require(:poll).permit(:title, :user_id)
  end

end
