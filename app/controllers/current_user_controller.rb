class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: current_user, status: :ok
  end

  def show
    user = User.find(current_user)
    render json: user, status: :ok
  end

  def save_score
    score = Score.create!(score_params)
    render json: score, status: :created
  end

  def update
    user = current_user.update!(user_params)
    render json: user
  end

  def set_avatar
    user = current_user
    user.update_attribute(:avatar, params[:avatar])
    render json: user, status: :accepted
  end

  private 

  def score_params
    params.permit(:score, :accuracy, :user_id, :style)
  end

  def user_params
    params.permit(:email, :password, :high_score, :avatar, :view_origin, :view_high_score, :view_profile)   
  end
end