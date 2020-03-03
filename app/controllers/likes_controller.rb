class LikesController < ApplicationController

    before_action :find_post, only: [:show, :create]
    before_action :find_like, only: [:destroy]

    def create 
        # current_user = current_user
        if already_liked? 
           
        else
        @post.likes.create(user_id: current_user.id)
        end
        redirect_to post_path(@post)
    end

    def destroy 
        if !(already_liked?)
            flash[:notice] = "cannot unlike"
        else
            @like.destroy
        end
        redirect_to post_path(@post)
    end

    private 

    def find_like 
        @post = Post.find(params[:post_id])
        @like = @post.likes.find(params[:id])
    end

    def already_liked? 
        Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
    end

    def find_post 
        @post = Post.find(params[:post_id])
    end
end
