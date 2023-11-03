class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  # Callbacks
  after_save :update_user_posts_counter

  # Methods
  def update_user_posts_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
