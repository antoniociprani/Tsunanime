class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    after_action :assign_role
    after_action :assign_username
    
    
    def assign_role
        if not current_user.nil?
            current_user.set_default
        end
    end

    def assign_username
        current_user.set_username
    end
    


    def google_oauth2
        @user = User.from_omniauth(request.env['omniauth.auth'])
        
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        
        sign_in_and_redirect @user, event: :authentication
    
    end
end