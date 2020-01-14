class Api::V1::QuestionsController < ApplicationController

  def index
    if params[:poll_id]
      poll = Poll.find_by(id: params[:poll_id])
      questions = poll.questions
    end
    render json: questions, status: 200
  end

  def show
    question = Question.find_by(id: params[:id])
    render json: question, include: [:answers]
  end

  def create
    poll = Poll.find_by(id: params[:poll_id])
    if poll
      question = poll.questions.build(question_params)
      poll.save
      render json: question
    end
  end

  private

  def question_params
    params.require(:question).permit(:content, :poll_id, answers_attributes: [:content])
  end

end
