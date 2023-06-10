class Event < ApplicationRecord
    has_many :sources
    belongs_to :author, class_name: "User"
    belongs_to :checker, class_name: "User", optional: true
    enum event_type: { macro: 0, micro: 1 }
    enum status: { draft: 0, published: 1 }
    enum event_status: { ongoing: 0, finished: 1 }
    
end
