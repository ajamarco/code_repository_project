class PostsController < ApplicationController
    before_action :require_logged_in
    before_action :set_post, only: [:show, :add_comment]
   
   
    def index 
        @posts = Post.all
    end

    def show 
        @comments = @post.comments
    end

    def new 
        @post = Post.new
        @languages = Language.all
        @tags = Tag.all
    end

    def create 
        
        @post = Post.new(allowed_params)
        @post.user_id = session[:user_id]
        
        if @post.save
           
        flash[:notice]  =  "post successfully created"
        redirect_to @post
        else 
         
            @languages = Language.all
            @tags = Tag.all
            flash[:errors] = @post.errors.full_messages 
            render :new

        end
    end

    def add_comment
        comment = Comment.new(post_id: @post.id, user_id: session[:user_id], content: params[:comment])
        if comment.save
            redirect_to @post
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to @post
        end
    end


    private 

    def set_post
        @post = Post.find(params[:id])
    end

    def allowed_params 
        params.require(:post).permit(:title, :description, :content, :language_id, tag_ids:[])
    end
end
