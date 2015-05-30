class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    @user = (user ||= User.new) # guest user (not logged in)

    send(@user.role)
  end

  private
  def admin
    can :manage, :all
  end

  def volunteer
    can [:read, :update], Site
    can :read, [Language]
    can :manage, [Article]
    can :read, User, role_id: [2, 3, 4]
    can :manage, User, role_id: @user.role_id
  end

  def contributor
    can [:read, :create, :update], Article
  end

  def anon
    can :read, Article
  end
end
