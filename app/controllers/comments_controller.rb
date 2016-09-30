class CommentsController < ApplicationController

  before_action :get_post_id
  
  def create
    unless current_user
      flash[:danger] = "Please sign in or sign up before commenting"
      redirect_to new_user_session_path
    else
      @comment = @post.comments.build(comment_params)
      @comment.user = current_user

      if @comment.save
        flash[:success] = "Comment created!"
      else
        flash.now[:danger] = "Commnet has not been created"
      end
      redirect_to post_path(@post)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def get_post_id
      @post = Post.find(params[:post_id])
    end
end
