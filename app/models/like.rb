class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Callbacks
  after_save :update_likes_counter

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
