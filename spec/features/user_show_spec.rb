require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before :each do
    @user = User.create(name: 'Pushkar', bio: 'A student from Morocco', photo: 'https://avatars.githubusercontent.com/u/130588108?v=4')
    @post1 = Post.create(author: @user, title: 'Hello Microverse', comments_counter: 0, likes_counter: 0)
    @post2 = Post.create(author: @user, title: 'Hi Java', comments_counter: 0, likes_counter: 0)
    @post3 = Post.create(author: @user, title: 'Ruby on Rails', comments_counter: 0, likes_counter: 0)
    @post4 = Post.create(author: @user, title: 'Gra_Madar', comments_counter: 0, likes_counter: 0)
    visit user_path(@user.id)
  end

  scenario 'Displays user Profile picture, username, bio and number of posts' do
    expect(page).to have_css('.user-photo')
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.bio)
   end

    scenario 'Displays user 3 posts' do
      expect(page).to have_content(@post1.title)
      expect(page).to have_content(@post2.title)
      expect(page).to have_content(@post3.title)
    end

    scenario 'Displays Button that lets me view all of a user posts, and redirects to the posts when clicked' do
      expect(page).to button_link('See all posts')
      click_link 'See all posts'
       sleep(1)
       expect(current_path).to eq(user_posts_path(@user.id))
    end

    it 'Should redirect to posts index  page when the see all posts butoon is clicked' do
      see_all_link_element = find('a', text: 'See all posts')
      see_all_link_element.click
      expect(current_path).to eq("/users/#{@user.id}/posts")
    end

    scenario 'click on user post redirects to that post show page.' do
      visit user_path(@user)

      click_link post1.title
      sleep(1)
      expect(current_path).to eq(user_post_path(@user, @post1))
    end
 end