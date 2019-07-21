require 'rails_helper'

describe 'Events API' do
  it 'sends a list of events' do
    create_list(:event, 3)

    get '/api/v1/events'

    expect(response).to be_successful
  end
end
