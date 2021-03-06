class ApplicationController < ActionController::Base
    devise_group :user, contains: [:student, :professor]

    before_action :configure_permitted_parameters, if: :devise_controller?

    protect_from_forgery
    
    # around_action :set_time_zone, if: :current_user

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :email, :password, :password_confirmation])
    end

    def authenticate_user!
        redirect_to root_path, notice: "Please Log In First to Continue the Process." unless user_signed_in? 
    end
end
