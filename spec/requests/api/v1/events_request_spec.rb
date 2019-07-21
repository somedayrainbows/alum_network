require 'rails_helper'

describe 'Events API' do
  it 'sends a list of events' do
    create_list(:event, 3)

    get '/api/v1/events'

    expect(response).to be_successful

    events = JSON.parse(response.body)

    expect(events.count).to eq(3)
  end

  it 'can get a single event by its id' do
    id = create(:event).id

    get "/api/v1/events/#{id}"

    expect(response).to be_successful

    event = JSON.parse(response.body)

    expect(event["id"]).to eq(id)
  end


end
