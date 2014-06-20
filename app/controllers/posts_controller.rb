class PostsController < ApplicationController
  def index
    @posts = Post.order(id: :desc).page(params[:page])
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


  def like
    @status  = nil
    @success = if current_user.like_post?(post)
      @status = 'dislike'
      current_user.dislike_post!(post)
    else
      @status = 'like'
      current_user.like_post!(post)
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
