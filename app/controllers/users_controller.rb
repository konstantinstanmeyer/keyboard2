class UsersController < ApplicationController
    # validates that only a valid user can get their current user information
    before_action :authenticate_user!, only: [:current]
    # fetches all users' information
    def index
        @users = User.all
        render json: @users
    end

    # gets current user's information from current_user value given by devise
    def current
        @user = User.find(current_user.id)
        render json: @user
    end

    # testing
    def get_quote
        puts params[:count]
    end

    # deletes user account w/ devise setup
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path, notice: 'User deleted.'
    end

    private 

    # allowed parameters for actions done to create/edit a user instance
    def user_params
        params.permit(:email, :password, :high_score, :view_origin, :view_high_score, :view_profile)
    end
end
