class ApplicationController < ActionController::API

    def configure_permitted_parameters    
        devise_parameter_sanitizer.permit { |u| u.permit(:avatar, :email, :password, :password_confirmation, :current_password) } 
    end
end
