class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    @comments = @post.comments.all
  end
  def new
    @comment = @post.comments.build
  end
  def create
    @comment = @post.comments.build(comments_params)
    if @comment.save
      flash[:notice] = "Comment created successfully"
      redirect_to post_comments_path(@post)
    else
      render :new
    end
  end
  def edit; end

  def update
    if @comment.update(comments_params)
      flash[:notice] = 'comment updated successfully'
      redirect_to post_comments_path(@post)
    else
      render :edit
    end
    def destroy
      @comment.destroy
      flash[:notice] = 'Comment Deleted Successfully'
      redirect_to post_comments_path(@post)
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
  def comments_params
    params.require(:comment).permit(:content)
  end
  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end
