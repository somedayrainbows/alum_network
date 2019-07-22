require 'rails_helper'

describe 'Alumni API' do
  it 'sends a list of alumni' do
    create_list(:alumni, 3)

    get '/api/v1/alumni'

    expect(response).to be_successful

    alumni = JSON.parse(response.body)

    expect(alumni.count).to eq(3)
  end

  it 'gets a single alumni by its id' do
    id = create(:alumni).id

    get "/api/v1/alumni/#{id}"

    expect(response).to be_successful

    alumni = JSON.parse(response.body)

    expect(alumni["id"]).to eq(id)
  end

  it 'creates a new alum' do
    alum_params = { first_name: "Zahra", last_name: "Mahmud", email: "zmahmud@email.com", admin: false, city: "Denver", state: "CO", country: "U.S.", cohort: "1701BE"}

    post "/api/v1/alumni", params: {alumni: alum_params}
    alum = Alumni.last

    expect(response).to be_successful
    expect(alum.first_name).to eq(alumni_params[:first_name])
    expect(alum.last_name).to eq(alum_params[:last_name])
  end

  it 'updates an existing alum' do
    id = create(:alumni).id
    previous_last_name = Alumni.last.last_name
    alum_params = { last_name: "Jones"}

    put "/api/v1/alumni/#{id}", params: {alumni: alum_params}
    alum = Alumni.find_by(id: id)

    expect(response).to be_successful
    expect(alum.last_name).to_not eq(previous_last_name)
    expect(alum.last_name).to eq(alum_params[:last_name])
  end

  it 'destroys an alumni' do
    alum = create(:alumni)

    expect{ delete "/api/v1/alumni/#{alum.id}" }.to change(Alumni, :count).by(-1)

    expect(response).to be_successful
    expect{Alumni.find(alum.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
