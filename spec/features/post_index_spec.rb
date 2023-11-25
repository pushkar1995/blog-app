require 'rails_helper'

RSpec.describe 'posts', type: :feature do
  describe '#index' do
    before(:each) do
      @user = User.create(name: 'Pushkar Gautam', bio: 'Undisputed of DIY', photo: 'https://avatars.githubusercontent.com/u/130588108?v=4',
                          posts_counter: 0)
      @post4 = Post.create(title: 'Hello', text: 'How to make a table', author_id: @user.id, comments_counter: 0,
                           likes_counter: 0)
      @post3 = Post.create(title: 'Hi', text: 'How to stay healthy', author_id: @user.id, comments_counter: 0,
                           likes_counter: 0)
      @post2 = Post.create(title: 'Health recipe', text: 'Eat balance diet', author_id: @user.id,
                           comments_counter: 0, likes_counter: 0)
      @post1 = Post.create(title: 'Energy', text: 'How to set the solar system', author_id: @user.id,
                           comments_counter: 0, likes_counter: 0)

      @comment1 = Comment.create(text: 'How to be a con artist', user_id: @user.id, post_id: @post4.id)
      @comment2 = Comment.create(text: 'How to solve a crime', user_id: @user.id, post_id: @post4.id)
      @comment3 = Comment.create(text: 'Great post', user_id: @user.id, post_id: @post4.id)
      @comment4 = Comment.create(text: 'That is just awful', user_id: @user.id, post_id: @post4.id)
      @comment5 = Comment.create(text: 'Good post!', user_id: @user.id, post_id: @post4.id)
      @comment6 = Comment.create(text: 'Awesome stuff', user_id: @user.id, post_id: @post4.id)

      visit user_posts_path(@user)
    end
    it 'displays user information' do
      expect(page).to have_css('img')
      expect(page).to have_content('Pushkar')
      expect(page).to have_content('Number of posts: 4')
    end

    it 'Should render the title of post' do
      expect(page).to have_content(@post2.title)
    end

    it 'display latest comments on a post' do
      expect(page).not_to have_content('How to be a con artist')
    end

    it 'Should render the body of post' do
      expect(page).to have_content(@post2.text)
    end

    it 'Should render the comments number for a post' do
      expect(page).to have_content("Comments: #{@post2.comments_counter.to_i}")
    end

    it 'Should render the Likes number for a post' do
      expect(page).to have_content(" Likes: #{@post2.likes_counter.to_i}")
    end

    context 'Clicking moments' do
      it "Should redirect to a specfic post's show page when a user's post is clicked" do
        post_id = @user.posts[0].id
        post_link_element = find("a[href='/users/#{@user.id}/posts/#{post_id}']")
        post_link_element.click
        expect(current_path).to eq("/users/#{@user.id}/posts/#{post_id}")
      end
    end
  end
end
