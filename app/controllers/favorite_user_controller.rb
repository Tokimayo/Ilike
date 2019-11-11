class FavoriteUserController < ApplicationController

  def new
    @user = User.find(current_user.id)
    @users = User.all
    @favorite_users = FavoriteUser.where(followers_user_id: current_user.id).order("created_at DESC")
  end

  def create
    @favorite_user = FavoriteUser.new(user_id: params[:user_id], followers_user_id: params[:followers_user_id])
    
    if @favorite_user.save
      redirect_to new_favorite_user_path, notice: 'Registration completed'
    else
      redirect_to new_favorite_user_path, alert: 'Registration fail'
    end
  end

  def destroy
    @favorite_user = FavoriteUser.where( user_id: params[:id]).where( followers_user_id: current_user.id).limit(1)
    favorite_user = FavoriteUser.find(@favorite_user[0].id)
    favorite_user.destroy if favorite_user.followers_user_id == current_user.id
    redirect_to new_favorite_user_path, alert: 'Release completed'
  end

  def search
    @users = User.where('name LIKE(?)', "#{params[:keyword]}%").where.not(id: current_user.id).limit(20)
    respond_to do |format|
     format.html
     format.json { render 'search_user', formats: 'json', handlers: 'jbuilder' }
    end
  end

  def other_user
    @favorite_user_check = FavoriteUser.where( user_id: params[:id]).where( followers_user_id: current_user.id)
    @other_user = User.find(params[:id])
    @likes = Like.where( user_id: @other_user.id )
    @favorite_user = FavoriteUser.new
  end

  def other_user_detail
    @like = Like.find( params[:id] )
  end

  private

  def create_favorite_params
    params.require(:favorite_user).permit(:user_id).merge(followers_user_id: current_user.id)
  end
end
