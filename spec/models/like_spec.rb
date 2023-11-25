require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'Should increase the likes counter number in post table' do
    author_object = User.new(name: 'Ariel_CEO')
    author_object.posts_counter = 0
    author_object.save
    post_object = Post.new(title: 'Microverse School')
    post_object.author_id = author_object.id
    post_object.comments_counter = 0
    post_object.likes_counter = 0
    post_object.save
    post_item = Post.find(post_object.id)
    like_object = Like.new(user_id: author_object.id, post_id: post_object.id)
    expect { like_object.save }.to change { post_item.reload.likes_counter }.by(1)
  end

  it 'Should be a valid like object' do
    author_object = User.new(name: 'Ariel_CEO')
    author_object.posts_counter = 0
    author_object.save
    post_object = Post.new(title: 'Microverse School')
    post_object.author_id = author_object.id
    post_object.comments_counter = 0
    post_object.likes_counter = 0
    post_object.save
    Post.find(post_object.id)
    like_object = Like.new(user_id: author_object.id, post_id: post_object.id)
    expect(like_object).to be_valid
  end

  it 'Should be an invalid like object' do
    like_object = Like.new
    expect(like_object).to be_invalid
  end
end
