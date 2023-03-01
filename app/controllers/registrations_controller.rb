class RegistrationsController < Devise::RegistrationsController
    
        private
            def sign_up_params
                params.require(:user, :email, :password, :username)
            end  
        end        
        
      
end