require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'Should increase the likes counter number in post table' do
    author_object = User.new(name: 'Ariel_CEO')
    author_object.posts_counter = 0
    author_object.save

    user_object = User.new(name: 'Graciano Manuel Henrique')
    user_object.posts_counter = 0
    user_object.save

    post_object = Post.new(title: 'Microverse School')
    post_object.author_id = author_object.id
    post_object.comments_counter = 0
    post_object.likes_counter = 0
    post_object.save
    post_item = Post.find(post_object.id)
    comment_object = Comment.new(user_id: user_object.id, post_id: post_object.id,
                                 text: 'I am studing the Backend in Microverse')
    expect { comment_object.save }.to change { post_item.reload.comments_counter }.by(1)
  end

  it 'Should be a valid comment object' do
    author_object = User.new(name: 'Ariel_CEO')
    author_object.posts_counter = 0
    author_object.save
    post_object = Post.new(title: 'Microverse School')
    post_object.author_id = author_object.id
    post_object.comments_counter = 0
    post_object.likes_counter = 0
    post_object.save
    Post.find(post_object.id)
    comment_object = Comment.new(user_id: author_object.id, post_id: post_object.id,
                                 text: 'I will add a new Module after Job Searching Module')

    expect(comment_object).to be_valid
  end

  it 'Should be an invalid comment object' do
    comment_object = Comment.new
    expect(comment_object).to be_invalid
  end
end
