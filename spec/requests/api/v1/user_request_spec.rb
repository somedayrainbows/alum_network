require 'rails_helper'

describe 'Users API' do
  it 'sends a list of users' do
    create_list(:user, 3)

    get '/api/v1/user'

    expect(response).to be_successful

    user = JSON.parse(response.body)

    expect(user.count).to eq(3)
  end

  it 'gets a single user by its id' do
    id = create(:user).id

    get "/api/v1/user/#{id}"

    expect(response).to be_successful

    user = JSON.parse(response.body)

    expect(user["id"]).to eq(id)
  end

  it 'creates a new user' do
    user_params = { first_name: "Zahra", last_name: "Mahmud", email: "zmahmud@email.com", admin: false, role: "alumni", city: "Denver", state: "CO", country: "U.S.", cohort: "1701BE"}

    post "/api/v1/user", params: {user: user_params}
    user = User.last

    expect(response).to be_successful
    expect(user.first_name).to eq(user_params[:first_name])
    expect(user.last_name).to eq(user_params[:last_name])
  end

  it 'updates an existing user' do
    id = create(:user).id
    previous_last_name = User.last.last_name
    user_params = { last_name: "Jones"}

    put "/api/v1/user/#{id}", params: {user: user_params}
    user = User.find_by(id: id)

    expect(response).to be_successful
    expect(user.last_name).to_not eq(previous_last_name)
    expect(user.last_name).to eq(user_params[:last_name])
  end

  it 'destroys an user' do
    user = create(:user)

    expect{ delete "/api/v1/user/#{user.id}" }.to change(user, :count).by(-1)

    expect(response).to be_successful
    expect{User.find(user.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
