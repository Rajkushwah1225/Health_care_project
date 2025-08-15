# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # The user object is passed in here. If no user is signed in, it's `nil`.
    user ||= User.new

    # A signed-in user can manage their own patients.
    if user.id.present?
      can :manage, Patient, user_id: user.id
    end
    # If we had an admin role, we could add: `if user.admin?`.
  end
end
