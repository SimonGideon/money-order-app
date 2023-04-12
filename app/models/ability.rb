class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Group

    return unless user.persisted?

    can :create, Group
    can :update, Group, user_id: user.id
    can :destroy, Group, user_id: user.id

    can [:index, :show, :new], MoneyOrder
    can :create, MoneyOrder, author_id: user.id
    can [:edit, :update, :destroy], MoneyOrder, author_id: user.id
  end
end
