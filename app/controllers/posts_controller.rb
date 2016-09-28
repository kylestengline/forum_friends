class PostsController < ApplicationController

  def index    
  end

  def new
    @post = Post.new
  end
   
  def create
    @post = Post.create(post_params)
  end

  private

  #strong params allowing title and content to come through
    def post_params
      params.require(:post).permit(:title, :content)
    end

end
