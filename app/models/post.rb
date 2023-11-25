class Post < ApplicationRecord
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :update_post_counter

  def show_post_comments(post, all_comments: false)
    all_comments ? Comment.includes(:post).where(post_id: post.id) : Comment.includes(:post).where(post_id: post.id).last(5)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
