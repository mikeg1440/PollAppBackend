class Api::V1::SubmissionsController < ApplicationController

  def index
    submissions = Submission.where(poll_id: params[:poll_id])
    render json: submissions
  end

  def create
    Submission.create(submission_params)
  end

  private

  def submission_params
    params.require(:submission).permit(:poll_id, :answer_id)
  end

end
