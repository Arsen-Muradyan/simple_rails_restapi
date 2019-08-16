class PostsController < ApplicationController
  # All Posts
  def index
      @posts = Post.all
      render json: @posts
  end
  # Single Posts
  def show
    @post = Post.find(params[:id])
    render json: @post
  end
  # New Post
  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      render json: {error: "Bad Request", status: 400}
    end
  end
  # Update Post
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render json: @post
    else
      render json: {error: "Bad Request", status: 400}
    end
  end
  # Delete Post
  def destroy
    @post = Post.find(params[:id])
    @posts = Post.all
    @post.destroy
    render json: @posts
  end
  # Post Paramas
  private def post_params
    params.require(:post).permit(:title, :body)
  end
end
