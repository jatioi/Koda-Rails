class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all

    if params[:title].present?
      @posts = @posts.where('title LIKE ?', "%#{params[:title]}%")
    end
    if params[:start_date].present? && params[:end_date].present?
      @posts = @posts.where(created_at: params[:start_date]..params[:end_date])
    end
    if @posts.present?
      @posts = @posts.order(created_at: :desc)
    end
    if params[:published].present?
      @posts = @posts.where(published: '1' == params[:published])
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post create failed'
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = 'Post update successfully'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post failed to update'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post destroy successfully'
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :published, category_ids: [])
  end
end
