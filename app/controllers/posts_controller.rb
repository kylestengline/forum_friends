class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :post_id, only: [:show, :edit, :destroy, :update]

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
      flash.now[:danger] = "Post not created"
      render :new
    end
  end

  def show
  end

  private

  #strong params allowing title and content to come through
    def post_params
      params.require(:post).permit(:title, :content)
    end

    def post_id
      @post = Post.find(params[:id])
    end

end
