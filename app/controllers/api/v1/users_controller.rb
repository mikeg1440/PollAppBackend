class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users, status: 200
  end

  def create
    User.create(user_params)
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user, status: 200

  end

  def delete

  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
