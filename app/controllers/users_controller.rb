class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
        byebug
      @user = User.create(user_params)
      byebug
      flash[:error] = "Not valid"
      return redirect_to controller: 'users', action: 'new' unless @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'sessions', action: 'home'
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end