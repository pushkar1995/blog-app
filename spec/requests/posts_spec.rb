describe "GET user 's posts /" do
  before :each do
    @user_gra = User.create(name: 'GracianoHenrique', photo: 'https://graciano.jpg', bio: 'Web Developer',
                            posts_counter: 0)
    @user_sha = User.create(name: 'Sha', photo: 'https://sha.jpg', bio: 'Web Developer', posts_counter: 0)
    @post1 = Post.create(author: @user_gra, title: 'Microverse Backend', text: 'the full stack remote web program',
                         comments_counter: 0, likes_counter: 0)
  end

  it 'should return a successfull response' do
    get "/users/#{@user_gra.id}/posts"
    expect(response).to be_successful
  end

  it 'should match a given user posts' do
    get "/users/#{@user_gra.id}/posts"
    expect(response.body).not_to include("Your User's 2 Posts")
  end

  it 'should return a 200 response status' do
    get "/users/#{@user_gra.id}/posts"
    expect(response.status).to eq(200)
  end

  it 'should return a 200 response status' do
    get '/users/2/posts/GracianoManuelHenrique/1997'
    expect(response.status).not_to eq(200)
  end

  it 'should render the index template' do
    get "/users/#{@user_gra.id}/posts"
    expect(response).to render_template('posts/index')
  end

  it 'should return a successfull response' do
    get '/users/2/posts/1000'
    expect(response).not_to be_successful
  end

  it 'should render the show template' do
    get '/users/2/posts/1000'
    expect(response).not_to render_template('posts/show')
  end

  it 'Should include <<Your User 2  and Post Id 1000>> ' do
    get '/users/2/posts/1000'
    expect(response.body).to include('Your User 2  and Post Id 1000')
  end
end
