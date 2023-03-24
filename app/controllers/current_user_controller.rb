# fetches user instance information using jwt token sent in Authorization header
class CurrentUserController < ApplicationController
  # validates user token before all actions besides 'show_scores'
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:show_scores]
  def index
    render json: current_user, status: :ok
  end

  # fetches current user instance information
  def show
    user = User.find(current_user)
    render json: user, status: :ok
  end

  # saves score with user's id as a foreign key 
  def save_score
    score = Score.create!(score_params)
    render json: score, status: :created
  end

  # 
  def show_scores
    user = User.find(params[:id])
    scores = user.scores
    render json: scores, status: :ok
  end

  # update_attribute allows specific fields to be updated per request, with this single method handling all update requests for user instances
  def update_user
    user = current_user
    user.update_attribute(:username, params[:username])
    user.update_attribute(:view_origin?, params[:view_origin?])
    user.update_attribute(:view_profile?, params[:view_profile?])
    user.update_attribute(:view_high_score?, params[:view_high_score?])
    render json: user, status: :ok
  end

  # built-in devise method
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

  # allowed parametes for requests acting on Score model
  def score_params
    params.permit(:score, :accuracy, :user_id, :style)
  end

  # allowed parametes for requests acting on User model
  def user_params
    params.permit(:email, :password, :high_score, :avatar, :view_origin, :view_high_score, :view_profile)   
  end
end
