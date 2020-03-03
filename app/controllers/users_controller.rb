class UsersController < ApplicationController
  before_action :require_logged_in, only: [:index]
  before_action :set_user, only: [:show, :index]
  
  def new
    @user = User.new
  end

  def index
    if @user.is_admin
      @users = User.all
    else
      redirect_to controller: 'sessions', action: 'home'
    end
    
  end
  
  def create
    @user = User.create(user_params)
    flash[:error] = "Successful"
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'sessions', action: 'home'
  end

  def show 
      @user = User.find(params[:id]) #override the set_user method
      @posts = @user.posts
  end

  private  
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def set_user 
    @user = User.find(session[:user_id])
  end

end
