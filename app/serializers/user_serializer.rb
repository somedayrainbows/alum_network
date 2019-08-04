class UserSerializer
  include FastJsonapi::ObjectSerializer

  # has_many :user_events
  # has_many :events, through: :user_events

  attributes :first_name, :last_name, :email, :role, :city, :state, :country, :cohort


  attribute :user_rsvps do |rsvps|
    rsvps.events.count
  end
end
