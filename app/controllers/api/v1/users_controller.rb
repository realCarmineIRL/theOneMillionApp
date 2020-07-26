class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users
  end

  def create
    @user = User.new(get_params)
    @user.save

    render json: @user
  end

  def show
    @user = User.find(params[:username])

    render json: @user
  end

  def destroy
    @user = User.find(params[:username])
    @user.destroy
    render json: @user
  end

  private

  def get_params
    params.permit(:username, :first_name, :last_name, :email, :password)
  end

end
