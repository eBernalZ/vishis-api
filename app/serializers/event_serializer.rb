class EventSerializer

  def initialize(event: nil)
    @event = event
  end

  def serialize_new_event()
      serialized_new_event = serialize_event(@event)
      serialized_new_event.to_json()
  end
    
  def serialize_event(event)
    {
        id: event.id,
        event_type: event.event_type,
        start_date: event.start_date,
        end_date: event.end_date,
        name: event.name,
        description: event.description,
        status: event.status,
        verified: event.verified,
        author_id: event.author_id,
        checker_id: event.checker_id,
        language: event.language,
        event_status: event.event_status,
        country: event.country,
        sources: event.sources,
        positions: event.getCoordinates()
    }
  end   
end