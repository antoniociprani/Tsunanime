class StaticController < ApplicationController
    before_action :username_is_set
    def show
        render params[:page]
    end

    def username_is_set
        if current_user.username.nil?
            redirect_to edit_user_registration_path(current_user), flash: {notice: "Inserisci un Username "} and return
    
        end
      end    
end
