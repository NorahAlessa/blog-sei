class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:index, :create, :edit, :update, :destroy, :new, :show]
    before_action :check_id, only: [:index]
    before_action :check_if_owner, only: [:edit, :update, :destroy,]
    def index
    end

    def new
        @post = Post.new
    end
    def create
        post = Post.new(params.require(:post).permit(:title, :content, :img))
        post.user_id = current_user.id
        post.save!
        redirect_to posts_path
    end
    def show
        @post = Post.find(params[:id])
    @comment = Comment.new

    end
    def edit
        @post = Post.find(params[:id])
    end
    def update
        post = Post.find(params[:id])
        post.update(params.require(:post).permit(:title, :content, :img))
        redirect_to post
      end
      def destroy
        Post.find(params[:id]).destroy
        redirect_to posts_path
      end

      private
    
      def check_id
        @post = current_user.posts
      end
      def check_if_owner
        @post = Post.find(params[:id])
        if current_user.id != @post.user_id
        redirect_to @post
        end
      end
end
