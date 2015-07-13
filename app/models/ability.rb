class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    @user = (user ||= User.new) # guest user (not logged in)

    # following roles exist: superadmin, admin, volunteer, contributor, guest, non-users

    if user.has_role? :superadmin
      can :manage, :all
      can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: :superadmin
    elsif user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :volunteer
      can [:read, :update], Site
      can :read, [Language]
      can :manage, [Article]
      can :read, User, role_id: [2, 3, 4]
      can :manage, User, role_id: @user.role_id
    elsif user.has_role? :contributor
      can [:read, :create, :update], Article
    else
      can :read, Article
    end
  end
end