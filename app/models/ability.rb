# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Event, { verified: true, status: :published }
    can :read, Source, { verified: true, status: :published }

    return unless user.present?
    can :create, Event
    can :read, Event, author_id: user.id
    can :update, Event, { author_id: user.id, status: :draft }
    can :destroy, Event, { author_id: user.id, status: :draft }

    can :create, Source
    can :read, Source, author_id: user.id
    can :update, Source, { author_id: user.id, status: :draft }
    can :destroy, Source, { author_id: user.id, status: :draft }

    return unless user.moderator?
    can :read, Event, { status: :published, verified: false }
    can :update, Event, { status: :published, verified: false }
    can :destroy, Event, { status: :published, verified: false }

    can :update, Source, { status: :published, verified: false }
    can :destroy, Source, { status: :published, verified: false }
    can :read, Source, { status: :published, verified: false }
    
    return unless user.admin?
    can :read, Event
    can :create, Event
    can :update, Event
    can :destroy, Event

    can :read, Source
    can :create, Source
    can :update, Source
    can :destroy, Source

  end
end
