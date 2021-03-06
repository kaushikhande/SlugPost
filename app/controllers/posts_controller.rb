class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def update
    @post = Post.friendly.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end

  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

end
