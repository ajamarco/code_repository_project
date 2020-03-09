class PostsController < ApplicationController
    before_action :require_logged_in
    before_action :set_post, only: [:show, :add_comment, :edit, :update]
   
   
    def index 
        @posts = params[:sort] ? Post.order_posts(params[:sort]) : Post.all
        @tags = Tag.all
    end

    def show 
        @comments = @post.comments
        @user = User.find(session[:user_id])
    end

    def new 
        @post = Post.new
        @languages = Language.all
        @tags = Tag.all
    end

    def create 
        
        @post = Post.new(allowed_params)
        @post.user_id = session[:user_id]
         @post.tags.build(name: "add tag")
        
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

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    def edit 

        @languages = Language.all
        @tags = Tag.all
        
    end

    def update 
        @post.update(allowed_params)
        redirect_to @post
    end

    private 

    def set_post
        @post = Post.find(params[:id])
    end

    def allowed_params 
        params.require(:post).permit(:title, :description, :content, :language_id, tag_ids:[], tags_attributes:[:name])
    end
end
