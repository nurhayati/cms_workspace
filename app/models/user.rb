class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Upload Avatar
  mount_uploader :avatar, AvatarUploader

  # Relationship
  has_many    :posts
end
