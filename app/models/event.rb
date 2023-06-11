class Event < ApplicationRecord
    has_many :sources
    belongs_to :author, class_name: "User"
    belongs_to :checker, class_name: "User", optional: true
    enum event_type: [:macro, :micro]
    enum status: [:draft, :published]
    enum event_status: [:ongoing, :finished]
    
end
