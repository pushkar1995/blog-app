require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'increments likes_counter on the associated post when a new like is created' do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                       posts_counter: 0)
    post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                       likes_counter: 0)

    # Create a new like associated with the post
    Like.create(user:, post:)

    # Reload the post object to get the updated likes_counter value from the database
    post.reload

    # Expect the likes_counter to be incremented by 1
    expect(post.likes_counter).to eq(1)
  end
end
