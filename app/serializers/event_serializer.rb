class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :date, :event_notes

  has_many :user_events
  has_many :users, through: :user_events

  attribute :user_rsvps do |meeting_rsvps|
    meeting_rsvps.users.count
  end

  attribute :greeting do
    "hello!"
  end
end
