class Source < ApplicationRecord
    belongs_to :event
    belongs_to :author, class_name: "User"
    belongs_to :checker, class_name: "User", optional: true
    enum source_type: [:url, :document]
end
