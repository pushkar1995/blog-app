require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }
  subject do
    Post.new(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
  end

  before do
    user.save
    subject.save
  end

  it('title should be present') do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it('title max length should be 250') do
    subject.title = 'a' * 300
    expect(subject).not_to be_valid
  end

  it('title length 200 should be valid') do
    subject.title = 'a' * 200
    expect(subject).to be_valid
  end

  it('comments_counter should be a number') do
    subject.comments_counter = nil
    expect(subject).not_to be_valid
  end

  it('comments_counter should be greater than or equal to 0') do
    subject.comments_counter = -1
    expect(subject).not_to be_valid
  end

  it('comments_counter should be equal to 0') do
    subject.comments_counter = 0
    expect(subject).to be_valid
  end

  it('comments_counter should be greater than 0') do
    subject.comments_counter = 3
    expect(subject).to be_valid
  end

  it('likes_counter should be a number') do
    subject.likes_counter = nil
    expect(subject).not_to be_valid
  end

  it('likes_counter should be greater than or equal to 0') do
    subject.likes_counter = -1
    expect(subject).not_to be_valid
  end

  it('likes_counter should be equal to 0') do
    subject.likes_counter = 0
    expect(subject).to be_valid
  end

  it('likes_counter should be greater than 0') do
    subject.likes_counter = 3
    expect(subject).to be_valid
  end

  it 'returns the five most recent comments for a post' do
    Comment.create(post: subject, user:, text: 'Hi Tom!')
    comment2 = Comment.create(post: subject, user:, text: 'Amazing!')
    comment3 = Comment.create(post: subject, user:, text: 'When is the next post?')
    comment4 = Comment.create(post: subject, user:, text: 'I have a question')
    comment5 = Comment.create(post: subject, user:, text: 'Hello!')
    comment6 = Comment.create(post: subject, user:, text: 'It\'s me')

    recent_comments = subject.recent_comments.to_a

    expect(recent_comments).to match_array([comment6, comment5, comment4, comment3, comment2])
  end

  it 'increments user posts_counter when a new post is created' do
    expect do
      Post.create(author: user, title: 'New Post', text: 'This is a new post', comments_counter: 0, likes_counter: 0)
    end
      .to change { user.reload.posts_counter }.by(1)
  end
end
