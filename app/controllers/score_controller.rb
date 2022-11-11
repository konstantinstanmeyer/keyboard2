class ScoreController < ApplicationController

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

    def user_scores
        @user = User.find_by(id: params[:id])
        render json: @user, serializer: UserScoreSerializerSerializer
    end

    def get_words
        @words = [""]
        params[:count].to_i.times do
            @words[0] << Score::WORDS.sample
            @words[0] << " "
        end
        render json: @words
    end

    private

    def score_params
        params.permit(:accuracy, :score, :user_id, :style, :word_length)
    end

end
