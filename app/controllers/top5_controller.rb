class Top5Controller < ApplicationController
  before_action :username_is_set
  def index
    @top_animes = Anime.order(:avg)
  end

  def username_is_set
    if current_user.username.nil?
        redirect_to edit_user_registration_path(current_user), flash: {notice: "Inserisci un Username "} and return

    end
  end    
end
