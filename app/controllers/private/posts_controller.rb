class Private::PostsControllers < Private::ModuleController


  def like
    @status = nil
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
end