class LikesController < ApplicationController

  def index
    @user = current_user
    @posts = Post.all
  end


  def create
    Like.create(:post => post, :user => current_user)
    redirect_to likes_path, :notice => "You just liked the post #{post.title}"
  end


  def destroy
    # Destroy it
    like.destroy
    redirect_to likes_path, :notice => "You destroyed a like"
  end


  private
    def post
      @post ||= Post.find params[:id]
    end

    def like
      @like ||= Like.find params[:id]
    end
end
