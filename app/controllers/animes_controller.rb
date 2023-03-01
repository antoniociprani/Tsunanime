class AnimesController < ApplicationController
  before_action :set_anime, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: :toggle_favorite
  before_action :username_is_set

  # GET /animes or /animes.json
  def index
    @animes = Anime.all
    
    
  end

  # GET /animes/1 or /animes/1.json
  def show
    @users = User.all
    @nuova = Review.new
    @reviews = Review.where(anime_id: @anime.id).order("created_at DESC")
    if @reviews.blank?
      @anime.avg = 0
      @anime.save
    else
      @anime.avg = @reviews.average(:rating).round(2)
      @anime.save
      
    end
    


  end

  # GET /animes/new
  def new
    @anime = Anime.new
  end

  # GET /animes/1/edit
  def edit
  end

  # POST /animes or /animes.json
  def create
    authorize! :create, Anime, :message => "You are not authorized"
    @anime = Anime.new(anime_params)

    respond_to do |format|
      if @anime.save
        format.html { redirect_to @anime, notice: "Anime was successfully created." }
        format.json { render :show, status: :created, location: @anime }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animes/1 or /animes/1.json
  def update
    authorize! :update, Anime, :message => "You are not authorized"
    respond_to do |format|
      if @anime.update(anime_params)
        format.html { redirect_to @anime, notice: "Anime was successfully updated." }
        format.json { render :show, status: :ok, location: @anime }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animes/1 or /animes/1.json
  def destroy
    authorize! :update, Anime, :message => "You are not authorized"
    @anime.destroy
    respond_to do |format|
      format.html { redirect_to animes_url, notice: "Anime was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #FAVORITE
  def toggle_favorite
    @anime = Anime.find_by(id: params[:id])
    current_user.favorited?(@anime) ? current_user.unfavorite(@anime) : current_user.favorite(@anime)
  end


  def username_is_set
    if current_user.username.nil?
        redirect_to edit_user_registration_path(current_user), flash: {notice: "Inserisci un Username "} and return

    end
  end    

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anime
      @anime = Anime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def anime_params
      params.require(:anime).permit(:title, :descripton, :release_date, :author, :image, :avg)
    end
end
