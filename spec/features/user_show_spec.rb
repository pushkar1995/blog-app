require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before :each do
    @user = User.create(name: 'Pushkar', bio: 'A student from Nepal', photo: 'https://avatars.githubusercontent.com/u/130588108?v=4')
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
    expect(page).to have_content("Number of posts: #{@user.posts.count}")
  end

  scenario 'display the user first 3 posts' do
    visit user_path(@user.id)
    @user.recent_posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end

  it 'See all posts should redirect to post index page' do
    see_all_posts_link = find('a', text: 'See all posts')
    see_all_posts_link.click
    expect(page).to have_current_path(user_posts_path(@user))
  end

  context 'When I click a user\'s post' do
    it 'redirects me to that post\'s show page' do
      visit user_path(@user.id)
      click_link('Hi Java')
      expect(page).to have_current_path(user_post_path(@user, @post2))
    end
  end
end
