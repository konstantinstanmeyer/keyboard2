class ApplicationController < ActionController::API

    # setup allowed parameters for devise gem | added avatar for activeStorage
    def configure_permitted_parameters    
        devise_parameter_sanitizer.permit { |u| u.permit(:avatar, :email, :password, :password_confirmation, :current_password) } 
    end
end
