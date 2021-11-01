class PostsController < ApplicationController
    def new
    end

    def create
        @post = Post.using_shard(:shard_group1, :shard1).new(params[:post].permit(:title, :text))
       
        @post.save
        redirect_to @post
      end

      def show
        @post = Post.using_shard(:shard_group1, :shard1).find(params[:id])
      end

      def index
        @posts = Post.using_shard(:shard_group1, :shard1).all
      end
       
      private
        def post_params
          params.require(:post).permit(:title, :text)
        end
end
