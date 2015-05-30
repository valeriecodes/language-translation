class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)

    send(user.role)
  end

  private
  def admin
    can :manage, :all
  end

  def volunteer
    can [:read, :update], Site
    can :read, [Language, User]
    can :manage, [Contributor, Article]
  end

  def contributor
    can [:read, :create, :update], Article
  end

  def anon
    can :read, Article
  end
end
