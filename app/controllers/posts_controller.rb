class PostsController < ApplicationController
   
    before_action :set_post, only: [:show]
   
   
    def index 
        @posts = Post.all
    end

    def show 
    end

    def new 
        @post.new
    end

    def create 
        @post.create[]
    end


    private 

    def set_post
        @post = Post.find(params[:id])
    end

    def allowed_params 
        params.require(:post).permit(:title, description:, content:, language:)
    end
end
