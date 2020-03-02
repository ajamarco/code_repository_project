class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
    flash[:error] = "Successful"
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'sessions', action: 'home'
  end

  def show 
      @posts = Post.all
  end

  private  
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def set_user 
    @user = User.find(params[:id])
  end
end
