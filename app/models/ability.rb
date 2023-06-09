class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Group
    can :read, :landing_pages

    return unless user.persisted?

    can :create, Group
    can :update, Group, user_id: user.id
    can :destroy, Group, user_id: user.id

    can %i[index show new], MoneyOrder
    can :create, MoneyOrder, author_id: user.id
    can %i[edit update destroy], MoneyOrder, author_id: user.id
  end
end
