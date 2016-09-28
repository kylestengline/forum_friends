class PostsController < ApplicationController

  def index    
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
   
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post Created!"
      redirect_to root_path
    else
      flash[:danger] = "Post not created"
      render :new
    end
  end

  private

  #strong params allowing title and content to come through
    def post_params
      params.require(:post)
      .permit(:title, :content)
    end

end
