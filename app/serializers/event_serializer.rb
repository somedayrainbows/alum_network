class EventSerializer
  include FastJsonapi::ObjectSerializer

  # has_many :user_events
  # has_many :users, through: :user_events

  attributes :title, :date, :event_notes

  attribute :user_rsvps do |meeting_rsvps|
    meeting_rsvps.users.count
  end
end
