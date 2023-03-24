# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  # utilize built-in create method from devise api
  def create 
    super
  end

  private
  
  # success/error response handling | devise api
  def respond_with(resource, _opts = {})
    render json: {
      status: {code: 200, message: 'Logged in sucessfully.'},
      data: UserLoginSerializerSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end
  
  # deletion success/error response requiring session to be sent within authorization header
  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: "logged out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
