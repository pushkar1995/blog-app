require 'rails_helper'

RSpec.describe 'users', type: :feature do
  describe 'index' do
    let(:user1) { User.create(name: 'Nick', photo: 'https://secure.b8cdn.com/images/uploads/user_photos/67/56263867_20211019183159.jpg', bio: 'Rabbit officer', posts_counter: 0) }

    let(:post4) do
      Post.create(title: 'Hello', text: 'How to make a table', author_id: user1.id, comments_counter: 0,
                  likes_counter: 0)
    end
    let(:post3) do
      Post.create(title: 'Hi', text: 'How to stay healthy', author_id: user1.id, comments_counter: 0, likes_counter: 0)
    end
    let(:post2) do
      Post.create(title: 'Health recipe', text: 'Eat balance diet', author_id: user1.id, comments_counter: 0,
                  likes_counter: 0)
    end
    let(:post1) do
      Post.create(title: 'Energy', text: 'How to set the solar system', author_id: user1.id, comments_counter: 0,
                  likes_counter: 0)
    end

    before(:each) do
      user1
      visit users_path
    end

    it 'shows all users' do
      expect(page).to have_content('Nick')
    end

    it 'display the photos for each user' do
      expect(page).to have_css("img[src*='https://secure.b8cdn.com/images/uploads/user_photos/67/56263867_20211019183159.jpg']")
    end

    it 'Display number of post' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'display number of posts for each user' do
      expect(page).to have_content("Number of posts: #{user1.posts.count}")
    end

    it 'Redirect to that user\'s show page on clicking a user' do
      click_link 'Nick'
      expect(page).to have_current_path(user_path(user1.id))
    end
  end
end
