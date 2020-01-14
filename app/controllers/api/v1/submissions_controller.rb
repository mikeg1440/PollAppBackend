class Api::V1::SubmissionsController < ApplicationController

  def index
    submissions = Submission.find_by(question_id: params[:question_id])
    render json: submissions, include: [:answer]
  end

end
