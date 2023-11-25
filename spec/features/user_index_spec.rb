# require 'rails_helper'

# RSpec.describe 'Index', type: :feature do
#   before :each do
#     @user_gra = User.create(name: 'GracianoHenrique', photo: 'https://graciano.jpg', bio: 'Web Developer',
#                             posts_counter: 0)
#     @user_sha = User.create(name: 'Sha', photo: 'https://sha.jpg', bio: 'Web Developer', posts_counter: 0)

#     @post1 = Post.create(author: @user_gra, title: 'Microverse Backend', text: 'the full stack remote web program',
#                          comments_counter: 0, likes_counter: 0)
#     @post2 = Post.create(author: @user_sha, title: 'Microverse FrontEnd', text: 'the front End remote web program',
#                          comments_counter: 0, likes_counter: 0)
#     @comment1 = Comment.create(text: 'I am expecting to become a Code Reviwer', user: @user_gra, post: @post2)
#     @comment2 = Comment.create(text: 'It will be very good!', user: @user_gra, post: @post2)
#     @comment3 = Comment.create(text: 'Very good !', user: @user_sha, post: @post1)
#     @comment3 = Comment.create(text: 'I will be mastering Rails', user: @user_sha, post: @post1)
#     @like1 = Like.create(user: @user_gra, post: @post1)
#     @like2 = Like.create(user: @user_sha, post: @post1)
#     visit '/users/'
#   end

#   context 'User GracianoHenrique context' do
#     it 'Should show GracianoHenrique user' do
#       expect(page).to have_content(@user_gra.name)
#     end

#     it 'Should have one post' do
#       expect(page).to have_content("Number of posts #{@user_gra.posts_counter.to_i}")
#     end

#     it 'Should redirected to a user When is clicked on a user name' do
#       user_link_element = find('a', text: @user_gra.name)
#       user_link_element.click
#       expect(current_path).to eq(user_path(@user_gra.id).concat('/'))
#     end
#   end

#   context 'User Sha context' do
#     it 'Should show Sha user' do
#       expect(page).to have_content(@user_sha.name)
#     end

#     it 'Should have one post' do
#       expect(page).to have_content("Number of posts #{@user_sha.posts_counter.to_i}")
#     end

#     it 'Should redirected to a user When is clicked on a user name' do
#       user_link_element = find('a', text: @user_sha.name)
#       user_link_element.click
#       expect(current_path).to eq(user_path(@user_sha.id).concat('/'))
#     end
#   end

#   it 'Should render the user image item' do
#     picture_elements = 0
#     all('.userItemContainer').each do |user|
#       expect(user).to have_css('.userPhotograph')
#       picture_elements += 1
#     end
#     expect(picture_elements).to be(2)
#   end
# end
