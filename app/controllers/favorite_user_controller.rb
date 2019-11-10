class FavoriteUserController < ApplicationController

  def new
    @user = User.find(current_user.id)
    @users = User.all
    @favorite_users = FavoriteUser.where(followers_user_id: current_user.id).order("created_at DESC")
  end

  def create
    @favorite_user = FavoriteUser.create(user_id: params[:user_id], followers_user_id: params[:followers_user_id])
    redirect_to root_path
  end

  def edit
    @other_user = User.find(params[:id])
    @likes = Like.where("user_id", params[:user_id])
  end

  def destroy
    @favorite_user = FavoriteUser.where( user_id: params[:id]).where( followers_user_id: current_user.id).limit(1)
    favorite_user = FavoriteUser.find(@favorite_user[0].id)
    favorite_user.destroy if favorite_user.followers_user_id == current_user.id
    redirect_to root_path, notice: 'Release complete'
  end

  def search
    @users = User.where('name LIKE(?)', "#{params[:keyword]}%").where.not(id: current_user.id).limit(20)
    respond_to do |format|
     format.html
     format.json { render 'search_user', formats: 'json', handlers: 'jbuilder' }
    end
  end

  def other_user
    @other_user = User.find(params[:id])
    @likes = Like.where("user_id", params[:user_id])
    @favorite_user = FavoriteUser.new
  end

  def other_user_detail
    @like = Like.find( params[:id] )
  end

  private

  def create_params
    params.require(:favorite_user).permit(:user_id).merge(followers_user_id: current_user.id)
  end
end
