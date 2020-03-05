class SessionsController < ApplicationController
    before_action :require_logged_in, only: :home
  
    def home
        @user = User.find(session[:user_id])
        @posts = @user.posts 
         
    end
    
    def new
        @user = User.new
    end

    def create
        user = User.find_by(name: params[:user][:name])
        user = user.try(:authenticate, params[:user][:password])
        if !user
            flash[:error] = "User / password invalid"
            @user = User.new
            return redirect_to(controller: 'sessions', action: 'new')
        end
        session[:user_id] = user.id
        @user = user
        redirect_to controller: 'sessions', action: 'home'
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end