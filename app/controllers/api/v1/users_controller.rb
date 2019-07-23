class Api::V1::UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    render json: User.create(user_params)
  end

  def update
    render json: User.update(params[:id], user_params)
  end

  def destroy
    render json: User.delete(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :admin, :role, :city, :state, :country, :cohort)
  end

end
