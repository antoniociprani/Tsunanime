class Users::RegistrationSController < Devise::RegistrationsController
    after_action :assign_role, only:[:create]
    
    
    def assign_role
        if not current_user.nil?
            current_user.set_default
        end
    end

    
   
    def destroy 
        @r = Review.all
        @u = current_user
        @r_destro = @r.where(user_id: current_user.id )
        @r_destro.each do |rw|
            rw.destroy
        end
        @u.delete
        redirect_to root_path
    end


    private
        def sign_up_params
            params.require(:user).permit(:email, :username, :password, :data)
    
        end
    

    
end