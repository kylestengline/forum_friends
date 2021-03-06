class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :get_post, only: [:show, :edit, :destroy, :update]

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
    @comment = @post.comments.build
  end
   
  def edit
    if @post.user != current_user
      flash[:danger] = "You can't edit other users posts"
      redirect_to root_path
    end
  end

  def update
    if @post.user != current_user
      flash[:danger] = "You can't edit other users posts"
      redirect_to root_path
    else
      if @post.update(post_params)
        flash[:success] = "Post Updated"
        redirect_to @post
      else
        flash[:danger] = "Post has not been updated"
        render :edit
      end
    end
  end

  def destroy
    if @post.destroy  
      flash[:success] = "Post has been deleted"
      redirect_to posts_path
    else
      flash[:danger] = "Post was not deleted"
      render :show
    end
  end

  private

  #strong params allowing title and content to come through
    def post_params
      params.require(:post).permit(:title, :content)
    end

    def get_post
      @post = Post.find(params[:id])
    end

end
