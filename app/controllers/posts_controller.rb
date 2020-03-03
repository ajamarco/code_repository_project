class PostsController < ApplicationController
    before_action :require_logged_in
    before_action :set_post, only: [:show]
   
   
    def index 
        @posts = Post.all
    end

    def show 
    end

    def new 
        @post= Post.new
        @languages = Language.all
        @tags = Tag.all
    end

    def create 
        @post = Post.create(allowed_params)
        redirect_to posts_path
    end


    private 

    def set_post
        @post = Post.find(params[:id])
    end

    def allowed_params 
        params.require(:post).permit(:title, :description, :content, :language_id, tag_ids:[])
    end
end
