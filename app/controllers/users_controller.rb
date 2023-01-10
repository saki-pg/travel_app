class UsersController < ApplicationController
  before_action :authenticate_user
  # , {only: [:show, :edit, :update]}



  def index
    @users = User.all
    @posts = Post.all
  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :passwords, :passwords_confirmation, :image, :name, :introduction))

    if @user.save
      # session[:user_id] = @user.id
      flash[:notice] = "アカウントを新規登録しました"
      redirect_to :users
    else
      @user = User.find_by(params[:user_id])
      render "users/show"
    end
  end


  def show
    @user = @current_user

    # @user = User.find(params[:id])
    @post = Post.new
    @posts = Post.where(user_id: @user.id)
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if @user.update(params.require(:user).permit(:email, :passwords, :passwords_confirmation, :image, :name, :introduction))
     flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
     redirect_to :users
   else
     render "edit"
   end
  end

  def destroy
  end

  def profile
    # @user = current_user
    @user = User.new
  end

  # def profile_create
  #     @user = User.new(params.require(:user).permit(:image, :name, :introduction))

  #   if @user.save
  #     flash[:notice] = "プロフィールを更新しました"
  #     redirect_to :users
  #   else
  #     @user = User.find_by(params[:user_id])
  #     render "users/profile"
  #   end

  # end


  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], passwords: params[:passwords])
   if @user
     session[:user_id] = @user.id
     flash[:notice] = "ログインしました"
     redirect_to ("/posts/index")
   else
     @error_message = "メッセージまたはパスワードが間違っています"
     @email = params[:email]
     render("users/login_form")
   end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to ("/login")
  end

 private
    def user_params
      params.require(:user).permit(:name, :email, :passwords, :passwords_confirmation)
    end

end
