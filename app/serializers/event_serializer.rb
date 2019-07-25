class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :date, :event_notes
end
