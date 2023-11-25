# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Using the expected params' do
    it 'expects to be valid with valid name' do
      user = User.new(name: 'Ariel_CEO')
      user.posts_counter = 0
      expect(user).to be_valid
    end

    it 'should respond to user_recent_posts' do
      user = User.new(name: 'Ariel_CEO')
      user.posts_counter = 0
      expect(user).to respond_to(:user_recent_posts)
    end

    it 'should display the 3 last recents posts' do
      author_object = User.new(name: 'Ariel_CEO')
      author_object.posts_counter = 0
      author_object.save
      user = User.new(name: 'Ariel_CEO')
      user.posts_counter = 0
      user.save
      post1 = Post.new(title: 'Microverse School')
      post1.author_id = user.id
      post1.text = 'I love Microverse'
      post1.comments_counter = 0
      post1.likes_counter = 0
      post1.save
      post2 = Post.new(title: 'Microverse School')
      post2.author_id = user.id
      post2.text = 'I love Microverse'
      post2.comments_counter = 0
      post2.likes_counter = 0
      post2.save
      post3 = Post.new(title: 'Microverse School')
      post3.author_id = user.id
      post3.text = 'I love Microverse'
      post3.comments_counter = 0
      post3.likes_counter = 0
      post3.save
      posts_number = user.user_recent_posts
      expect(posts_number.count).to eq(3)
    end
  end

  context 'Using the unexpected values or params' do
    it 'Mr Ariel Should have an invalid posts_counter number <2023.5>' do
      user = User.new(name: 'Ariel_CEO')
      user.posts_counter = 2023.5
      expect(user).to be_invalid
    end

    it "expects not to be valid without a user's name" do
      user = User.new
      expect(user).not_to be_valid
    end

    it 'expects not to be valid with a negative post_counter' do
      user = User.new(name: 'Ariel_CEO')
      user.posts_counter = -2023
      expect(user).to be_invalid
    end
  end
end
