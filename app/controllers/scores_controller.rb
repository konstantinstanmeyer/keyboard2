class ScoresController < ApplicationController
    before_action :authenticate_user!, only: [:create]

    def index
        @scores = Score.all
        render json: @scores
    end

    def create
        @score = Score.create!(score_params)
        render json: @score, status: :created
    end
    
    def show
        @score = Score.find_by(user_id: params[:user_id])
        render json: @score
    end

    private

    def score_params
        params.permit(:accuracy, :score, :user_id, :style)
    end

end
