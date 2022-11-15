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

    def get_quote
        puts params[:count]
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path, notice: 'User deleted.'
    end

    private 

    def user_params
        params.permit(:email, :password, :high_score, :view_origin, :view_high_score, :view_profile)
    end
end