class PostsController < ApplicationController
  before_action :authenticate_user

  def index
     @posts = Post.all
     @user = current_user
      #   @posts = Post.all.order(created_at: :desc)
  end

  def news
     @post = Post.new
  end

  def create
     @post = Post.new(params.require(:post).permit(:user_id,:room_name, :room_introduction, :price, :address, :room_image))
     @post.user_id = current_user.id

    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to :users
    else
      @user = Use.find_by(params[:post][:user_id])
      render "users/show"
    end

  #     @red = Red.new(params.require(:red).permit(:content, :run_id))
  # if @red.save
  #   flash[:notice] = "新規投稿をしました"
  #   redirect_to :runs
  # else
  #   @run = Run.find_by(params[:red][:run_id])
  #   render "runs/show"
  # end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update

    @post = Post.find(params[:id])
     if @post.update(params.require(:post).permit(:user_id, :room_name, :room_introduction, :price, :address, :room_image))
       flash[:notice] = "投稿を更新しました"
       redirect_to :users
     else
       render "edit"
     end

    # @post = Post.find_by(id: params[:id])
    # @post.content = params[:user_id, :room_name, :room_introduction, :price, :address, :room_image]
    # if @post.save
    #   flash[:notice] = "投稿を編集しました"
    #   redirect_to("/posts/index")
    # else
    #   render("posts/edit")
    # end
  end

  def list
    @posts = Post.all
    # @post = Post.find(params[:id])
  end

  def search
      if params[:area] == nil && params[:keyword] == nil
      @post = Post.all
      @cnt = Post.all.count
    elsif params[:area] == "" && params[:keyword] == ""
      @post = Post.all
      @cnt = Post.all.count
    elsif params[:area]
      @post = Post.where("address LIKE?",'%'+params[:area]+'%')
      @cnt = Post.where("address LIKE?",'%'+params[:area]+'%').count
    elsif  params[:keyword]
      @post = Post.where("name LIKE?",'%'+params[:keyword]+'%').or(Post.where("address LIKE?",'%'+params[:keyword]+'%')).or(Post.where("information LIKE?",'%'+params[:keyword]+'%')) .or(Post.where("price LIKE?",'%'+params[:keyword]+'%'))
      @cnt = Post.where("name LIKE?",'%'+params[:keyword]+'%').or(Post.where("address LIKE?",'%'+params[:keyword]+'%')).or(Post.where("information LIKE?",'%'+params[:keyword]+'%')) .or(Post.where("price LIKE?",'%'+params[:keyword]+'%')) .count
    else
    end
  end

  def destroy
    @post = Post.find(params[:id])
     @post.destroy
     flash[:notice] = "投稿を削除しました"
     redirect_to :users

    # @post = Post.find_by(id: params[:id])
    # @post.destroy
    # flash[:notice] = "投稿を削除しました"
    # redirect_to("/posts/index")
  end
end

