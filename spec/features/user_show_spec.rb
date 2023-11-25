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
    @comment3 = Comment.create(text: 'Very good !', user: @user_sha, post: @post1)
    @comment3 = Comment.create(text: 'I will be mastering Rails', user: @user_sha, post: @post1)
    @like1 = Like.create(user: @user_gra, post: @post1)
    @like2 = Like.create(user: @user_sha, post: @post1)
    visit user_path(@user_gra.id)
  end

  context 'User GracianoHenrique show page Items' do
    it 'Should show GracianoHenrique user' do
      expect(page).to have_content(@user_gra.name)
    end

    it 'Should render the user image item' do
      picture_elements = 0
      all('.userItemContainer').each do |user|
        expect(user).to have_css('.userPhotograph')
        picture_elements += 1
      end
      expect(picture_elements).to be(1)
    end

    it 'Should render the 3 posts items' do
      posts_items = 0
      all('.postItemContainer').each do |post|
        expect(post).to have_css('p')
        posts_items += 1
      end
      expect(posts_items).to be(3)
    end

    it 'Should have one post' do
      expect(page).to have_content("Number of posts #{@user_gra.posts_counter.to_i}")
    end

    it 'Should display the user Bio' do
      expect(page).to have_content(@user_gra.bio)
    end

    it 'Should render the see all posts Button' do
      expect(page).to have_button('See all posts')
    end
  end

  context 'Clicking moments' do
    it "Should redirect to a specfic post's show page when a user's post is clicked" do
      post_id = @user_gra.posts[0].id
      post_link_element = find("a[href='/users/#{@user_gra.id}/posts/#{post_id}']")
      post_link_element.click
      expect(current_path).to eq("/users/#{@user_gra.id}/posts/#{post_id}")
    end

    it 'Should redirect to posts index  page when the see all posts butoon is clicked' do
      see_all_link_element = find('a', text: 'See all posts')
      see_all_link_element.click
      expect(current_path).to eq("/users/#{@user_gra.id}/posts")
    end
  end
end
