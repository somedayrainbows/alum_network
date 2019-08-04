require 'rails_helper'

describe 'Events API' do
  it 'sends a list of events' do
    create_list(:event, 3)

    get '/api/v1/events'

    expect(response).to be_successful

    events = JSON.parse(response.body)

    expect(events["data"].count).to eq(3)
  end

  it 'gets a single event by its id' do
    id = create(:event).id

    get "/api/v1/events/#{id}"

    expect(response).to be_successful

    event = JSON.parse(response.body)
    expect(event["data"]["id"]).to eq(id.to_s)
  end

  it 'creates a new event' do
    event_params = { title: "Happy Hour", date: "Tuesday, August 6, 2019", event_notes: "Meet at the bar at 5pm; hosted appetizers until 6pm. Fellowship and mingling with other User."}

    post "/api/v1/events", params: {event: event_params}
    event = Event.last
    expect(response).to be_successful
    expect(event.title).to eq("Happy Hour" && event_params[:title])
    expect(event.event_notes).to eq(event_params[:event_notes])
  end

  it 'updates an existing event' do
    id = create(:event).id
    previous_title = Event.last.title
    event_params = { title: "Group bike ride"}

    put "/api/v1/events/#{id}", params: {event: event_params}
    event = Event.find_by(id: id)

    expect(response).to be_successful
    expect(event.title).to_not eq(previous_title)
    expect(event.title).to eq("Group bike ride")
  end

  it 'destroys an event' do
    event = create(:event)

    expect{ delete "/api/v1/events/#{event.id}" }.to change(Event, :count).by(-1)

    expect(response).to be_successful
    expect{Event.find(event.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end


end
