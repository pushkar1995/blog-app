require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }
  before { subject.save }

  it('name should be present') do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it('posts_counter should be a number') do
    subject.posts_counter = nil
    expect(subject).not_to be_valid
  end

  it('posts_counter should be greater than or equal to 0') do
    subject.posts_counter = -1
    expect(subject).not_to be_valid
  end

  it('posts_counter should be equal to 0') do
    subject.posts_counter = 0
    expect(subject).to be_valid
  end

  it('posts_counter should be greater than 0') do
    subject.posts_counter = 3
    expect(subject).to be_valid
  end

  it 'returns the three most recent posts' do
    user1 = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Bio 1', posts_counter: 3)
    Post.create(author: user1, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    post2 = Post.create(author: user1, title: 'nice ', text: 'This is nice work', comments_counter: 0,
                        likes_counter: 0)
    post3 = Post.create(author: user1, title: 'Keep it Up', text: 'This is my word', comments_counter: 0,
                        likes_counter: 0)
    post4 = Post.create(author: user1, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                        likes_counter: 0)

    recent_posts = user1.recent_posts.to_a
    expect(recent_posts).to match_array([post4, post3, post2])
  end
end
