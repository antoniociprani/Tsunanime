class ToolsController < ApplicationController
  def index
    @users = User.all
    @anime = Anime.new
    
  end

  def update
    userId = params[:userId]
    @user = User.find_by(id: userId)
    @user.set_moderator
    redirect_to tools_index_path
  end

  def downgrade
    userId = params[:userId]
    @user = User.find_by(id: userId)
    @user.unset_moderator
    redirect_to tools_index_path
  end

  def ban
    userId = params[:userId]
    @user = User.find_by(id: userId)
    @user.ban
    redirect_to tools_index_path
  end

  def unban
    userId = params[:userId]
    @user = User.find_by(id: userId)
    @user.unban
    redirect_to tools_index_path
  end
  
  

end
