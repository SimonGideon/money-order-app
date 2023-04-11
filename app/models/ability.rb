class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Group

    return unless user.persisted?

    can :create, Group
    can :update, Group, user_id: user.id
    can :destroy, Group, user_id: user.id
  end
end
