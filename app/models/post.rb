class Post < ActiveRecord::Base

  # Validation
  validates :title, presence: true,
                    length: { minimum: 5 }
  # Relationship
  has_and_belongs_to_many :categories
  has_many :comments, dependent: :destroy
  belongs_to :user
end
