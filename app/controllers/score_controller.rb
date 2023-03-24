class ScoreController < ApplicationController

    # returns all scores for all users
    def index
        @scores = Score.all
        render json: @scores
    end

    # creates a score using a user_id for the foreign key, using score_params defined in private methods
    def create
        @score = Score.create!(score_params)
        render json: @score, status: :created
    end
    
    # returns all scores for a user / test
    def show
        @score = Score.find_by(user_id: params[:user_id])
        render json: @score
    end

    # returns all scores for a user
    def user_scores
        @user = User.find_by(id: params[:id])
        render json: @user, serializer: UserScoreSerializerSerializer
    end

    # returns randomized word sample from Score model
    def get_words
        @words = [""]
        params[:count].to_i.times do
            @words[0] << Score::WORDS.sample
            @words[0] << " "
        end
        render json: @words
    end

    private

    # permitted fields for requests acting on the score model
    def score_params
        params.permit(:accuracy, :score, :user_id, :style, :word_length)
    end

end
