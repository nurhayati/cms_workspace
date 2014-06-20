class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Upload Avatar
  mount_uploader :avatar, AvatarUploader

  # Relationship
  has_many    :posts
  has_many    :likes



  # Return true  if user has been like post
  def like_post?(post)
    likes.where(post_id: post.id).present?
  end


  # Return true if valid succes saveing
  def like_post!(post)
    like = likes.new(post: post)
    like.save
  end


  # Return true if likee deleted
  def dislike_post!(post)
    like = likes.where(post_id: post.id).first
    if like.present?
      like.destroy
    end
  end
end
