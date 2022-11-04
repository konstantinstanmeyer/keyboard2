class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:current]
    def index
        @users = User.all
        render json: @users
    end

    def current
        @user = User.find(current_user.id)
        render json: @user
    end

    private 

    def user_params
        params.permit(:email, :password, :high_score, :avatar)   
    end
end