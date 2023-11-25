require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'expects to be valid with valid attribute' do
    author_object = User.new(name: 'Ariel_CEO')
    author_object.posts_counter = 0
    author_object.save
    post_object = Post.new(title: 'Microverse School')
    post_object.author_id = author_object.id
    post_object.comments_counter = 0
    post_object.likes_counter = 0
    expect(post_object).to be_valid
  end

  it 'should not be a valid post' do
    post_object = Post.new(title: 'Microverse School')
    post_object.comments_counter = 0
    post_object.likes_counter = 0
    expect(post_object).not_to be_valid
  end

  it 'should not be a valid post' do
    author_object = User.new(name: 'Ariel_CEO')
    author_object.posts_counter = 0
    author_object.save
    post_object = Post.new(title: 'Microverse School')
    post_object.comments_counter = 2.40
    post_object.likes_counter = 2.3
    expect(post_object).to be_invalid
  end

  it 'should not be a valid post' do
    author_object = User.new(name: 'Ariel_CEO')
    author_object.posts_counter = 0
    author_object.save
    post_object = Post.new(title: 'Microverse School')
    post_object.comments_counter = -2
    post_object.likes_counter = -2
    expect(post_object).to be_invalid
  end

  it 'Should respond to some methods' do
    author_object = User.new(name: 'Ariel_CEO')
    author_object.posts_counter = 0
    author_object.save
    post_object = Post.new(title: 'Microverse School')
    post_object.author_id = author_object.id
    post_object.text = 'My school'
    post_object.comments_counter = 0
    post_object.likes_counter = 0
    expect(post_object).to respond_to(:show_post_comments)
  end

  it 'Should increase the author post_counter number' do
    author_object = User.new(name: 'Ariel_CEO')
    author_object.posts_counter = 0
    author_object.save
    post_object = Post.new(title: 'Microverse School')
    post_object.author_id = author_object.id
    post_object.text = 'My school'
    post_object.comments_counter = 0
    post_object.likes_counter = 0
    author_from_db = User.find(author_object.id)
    expect { post_object.save }.to change { author_from_db.reload.posts_counter }.by(1)
  end

  it 'Should show the 5 comments' do
    author_object = User.new(name: 'Graciano Henrique')
    author_object.posts_counter = 0
    author_object.save

    post_object = Post.new(title: 'Microverse School')
    post_object.author_id = author_object.id
    post_object.text = 'Remote School'
    post_object.comments_counter = 0
    post_object.likes_counter = 0
    post_object.save

    comment_object1 = Comment.new(user_id: author_object.id, post_id: post_object.id,
                                  text: 'I want to study HTML & CSS')
    comment_object1.save
    comment_object2 = Comment.new(user_id: author_object.id, post_id: post_object.id, text: 'I want to study JS')
    comment_object2.save
    comment_object3 = Comment.new(user_id: author_object.id, post_id: post_object.id, text: 'I want to study REACT')
    comment_object3.save
    comment_object4 = Comment.new(user_id: author_object.id, post_id: post_object.id, text: 'I want to study Ruby')
    comment_object4.save
    comment_object5 = Comment.new(user_id: author_object.id, post_id: post_object.id,
                                  text: 'I want to study Ruby on Rails')
    comment_object5.save
    comments = post_object.show_post_comments(post_object)
    expect(comments.count).to eq(5)
  end
end
