require 'rails_helper'

RSpec.describe 'Index', type: :feature do
  before :each do
    @user_gra = User.create(name: 'GracianoHenrique', photo: 'https://graciano.jpg', bio: 'Web Developer',
                            posts_counter: 0)
    @user_sha = User.create(name: 'Sha', photo: 'https://sha.jpg', bio: 'Web Developer', posts_counter: 0)

    @post1 = Post.create(author: @user_gra, title: 'Microverse Backend', text: 'the full stack remote web program',
                         comments_counter: 0, likes_counter: 0)
    @post2 = Post.create(author: @user_gra, title: 'Microverse FrontEnd', text: 'the front End remote web program',
                         comments_counter: 0, likes_counter: 0)
    @post3 = Post.create(author: @user_gra, title: 'Microverse Job Searching',
                         text: 'In this module, student search for job opportunities ...', comments_counter: 0, likes_counter: 0)
    @comment1 = Comment.create(text: 'I am expecting to become a Code Reviwer', user: @user_gra, post: @post2)
    @comment2 = Comment.create(text: 'It will be very good!', user: @user_sha, post: @post2)
    @comment3 = Comment.create(text: 'Very good !', user: @user_sha, post: @post2)
    @comment4 = Comment.create(text: 'I will be mastering Rails', user: @user_sha, post: @post1)
    @like1 = Like.create(user: @user_gra, post: @post1)
    @like2 = Like.create(user: @user_sha, post: @post1)
    visit "/users/#{@user_gra.id}/posts/#{@post2.id}"
  end

  context 'User GracianoHenrique show page Items' do
    it 'Should render the comments number for a post' do
      expect(page).to have_content("Comments: #{@post2.comments_counter.to_i}")
    end

    it 'Should render post author' do
      expect(page).to have_content('Post #'.concat("#{@post2.id} by #{@post2.author.name}"))
    end

    it 'Should render the Likes number for a post' do
      expect(page).to have_content(" Likes: #{@post2.likes_counter.to_i}")
    end

    it 'Should render the body of post' do
      expect(page).to have_content(@post2.text)
    end

    it 'Should render the name of all commenters' do
      @post2.comments.each do |comment|
        expect(page).to have_content(comment.user.name)
      end
    end

    it 'Should render the comments ' do
      @post2.comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end

    it 'Should render the title of post' do
      expect(page).to have_content("Title: #{@post2.title}")
    end

    it 'Should render the first comments of a post' do
      expect(page).to have_content(@post2.comments[0].text)
    end
  end
end
