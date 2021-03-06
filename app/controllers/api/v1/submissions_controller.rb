class Api::V1::SubmissionsController < ApplicationController

  def index
    submissions = Submission.where(poll_id: params[:poll_id])
    render json: submissions
  end

  def create
    submission = Submission.create(submission_params)
    if submission.valid?
      render json: submission, status: :created
    else
      render json: submission.errors.full_messages, status: :bad_request
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:poll_id, :answer_id)
  end

end
