class SearchsController < ApplicationController
    def search_posts
        if params[:title].blank?
            flash[:errors] = ["Empty search field"]
            return redirect_to root_path 
        else
            param = params[:title].downcase
            @posts = Post.all.where("lower(title) LIKE ?", "%#{param}%")
            render 'posts/index' 
        end  
    end

    def search_posts_within_user
        if params[:title].blank?
            flash[:errors] = ["Empty search field"]
            return redirect_to root_path 
        else
            param = params[:title].downcase
            @user = User.find(session[:user_id])
            @posts = @user.posts
            @posts = @posts.all.where("lower(title) LIKE ?", "%#{param}%")
            render 'posts/index'
        end
    end
end