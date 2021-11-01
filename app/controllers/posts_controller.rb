class PostsController < ApplicationController
    before_action :set_shard

    def new
    end

    def create
        Rails::Sharding.using_shard(@shard_group, @shard) do
            @post = Post.new(params[:post].permit(:title, :text))
        
            @post.save
            redirect_to @post
        end
      end

      def show
        @post = Post.using_shard(@shard_group, @shard).find(params[:id])
      end

      def index
        puts @shard_group
        @posts = Post.using_shard(@shard_group, @shard).all
      end
       
      private
        def set_shard
            @shard_group = :shard_group1
            @shard = :shard2
        end

        def post_params
          params.require(:post).permit(:title, :text)
        end
end
