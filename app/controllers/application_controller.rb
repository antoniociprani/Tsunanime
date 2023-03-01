class ApplicationController < ActionController::Base
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, :alert => exception.message
    end

    


    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :data])
        devise_parameter_sanitizer.permit(:account_update, keys: [:email,:avatar, :username, :data])
        
    end

end
