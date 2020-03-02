class PostsController < ApplicationController
   
    before_action :set_post
   
   
    def index 
        @posts = Post.all
    end

    def show 
    end

    def new 
    end

    def create 
    end


    private 

    def set_post
        @post = Post.find(params[:id])
    end
end
