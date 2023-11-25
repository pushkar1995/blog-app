describe "Render User's GET Routes " do
  it 'Should renders a successful response and have 200 as response status' do
    get '/'
    expect(response).to be_successful
    expect(response.status).to be 200
  end

  it 'Should renders a successful response' do
    get users_url
    expect(response).to be_successful
  end

  it 'Should render a successful the user_index template ' do
    get users_url
    expect(response).to render_template('users/index')
  end

  it 'Should include <<Here is your  list of users>> in the body of page ' do
    get users_url
    expect(response.body).not_to include('Here is your  list of users')
  end

  it 'Should not be 404 response status' do
    get users_url
    expect(response.status).not_to eq(404)
  end

  it 'Should be 404 response status' do
    get '/user_graciano_url'
    expect(response.status).to be(404)
  end

  it "Should render a successful response for a given user's id " do
    get users_url(20)
    expect(response).to be_successful
  end
end
