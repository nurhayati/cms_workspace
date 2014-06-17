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
      redirect_to posts_path
    else
      render 'new'
    end

  end

  def show
    post
  end

  def edit
    post
  end


  def update
    if post.update_attributes(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end


  def destroy
    if post.destroy
      redirect_to posts_path
    end
  end


  private
    def post
      @post ||= Post.find params[:id]
    end

    def post_params
      params.require(:post).permit(:title, :body, :category_ids)
    end
end
