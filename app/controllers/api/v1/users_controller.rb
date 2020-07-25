class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users
  end

  def create
    @user = User.new(get_params)
    @user.save
  end

  def show
    @user = User.find(params[:id])

    render json: @user
  end

  private

  def get_params
    params.require(:username).permit(:first_name, :last_name)
  end
end
