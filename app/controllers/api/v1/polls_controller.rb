class Api::V1::PollsController < ApplicationController

  def index
    polls = Poll.all
    render json: polls, status: 200
  end

  def create
    poll = Poll.create(poll_params)
    if poll.valid?
      render json: poll, status: :created
    else
      render json: poll.errors.full_messages, status: :bad_request
    end
  end

  def show
    poll = Poll.find_by(id: params[:id])
    render json: poll, status: 200
  end

  private

  def poll_params
    params.require(:poll).permit(:title, :author, :question, answers_attributes: [:content])
  end

end
