class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: current_user, status: :ok
  end

  def show
    user = User.find(current_user)
    render json: user, status: :ok
  end

  def update
    user = current_user.update!(user_params)
    render json: user
  end

  def high_score
    user = current_user
    user.update_attribute(:high_score, params[:high_score])
    render json: user, status: :ok
  end

  def set_avatar
    user = current_user
    user.update_attribute(:avatar, params[:avatar])
    render json: user, status: :accepted
  end

  private 

  def user_params
    params.permit(:email, :password, :high_score, :avatar)   
  end
end