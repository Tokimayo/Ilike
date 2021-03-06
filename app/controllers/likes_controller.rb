class LikesController < ApplicationController

  def index
    @likes = Like.where(user_id: current_user.id).order("updated_at DESC")
    @new_like = Like.new
  end
  
  def create
    @new_like = Like.new(create_params)

    if @new_like.save
      redirect_to root_path, notice: 'Registration completed'
    else
      @errors = @new_like.errors
      redirect_to root_path, alert: 'Registration fail'
    end
    
  end

  def edit
    @like = Like.find(params[:id])
  end

  def show
    like = Like.find(params[:id])
    @likes = Like.where(things: like.things).where.not(user_id: current_user.id)
  end

  def update
    like = Like.find(params[:id])
    like.update(create_params)
    redirect_to root_path, notice: 'Update completed'
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy if like.user_id == current_user.id
    redirect_to root_path, alert: 'Delete completed'
  end

  def search
    # keyword = "%#{params[:keyword]}%"
    @likes = Like.where('things LIKE(?)', "#{params[:keyword]}%").or(Like.where('genre LIKE(?)', "#{params[:keyword]}%")).where.not(user_id: current_user.id).limit(20)
    # @likes = Like.find_by_sql(["select * from likes where things like ? LIMIT 20", keyword]).where.not(id: current_user.id)
   respond_to do |format|
     format.html
     format.json { render 'search', formats: 'json', handlers: 'jbuilder' }
   end
  end

  private

  def create_params
    params.require(:like).permit(:genre, :things, :image, :description, :url).merge(user_id: current_user.id)
  end
end