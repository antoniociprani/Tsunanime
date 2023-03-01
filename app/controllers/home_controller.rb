class HomeController < ApplicationController
  before_action :username_is_set

  def index
    @latest_animes = Anime.order(:release_date).reverse
    @latest_reviews = Review.order(:created_at).reverse
    @anime = Anime.all
    @users = User.all
  end
  

  def username_is_set
    if current_user.username.nil?
        redirect_to edit_user_registration_path(current_user), flash: {notice: "Inserisci un Username "} and return

    end
  end    



end
