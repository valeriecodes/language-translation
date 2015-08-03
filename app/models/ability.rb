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
      can :manage, [Language, Category, Article]
      can :manage, [Installation, User],
          organization_id: @user.organization.id
      can :manage, Site,
          installation_id: @user.organization.installations.map { |a| a.id }

    elsif user.has_role? :volunteer, :any
      can :read, [Language, Category]
      can :manage, [Article]
      can :read, User,
          organization_id: @user.organization.id
      can :manage, User,
          organization_id: @user.organization.id,
          id: User.with_any_role({name: :contributor, resource: :any}, :guest).map { |a| a.id }
      can [:read, :update], Site,
          installation_id: @user.organization.installations.map{ |a| a.id }

    elsif user.has_role? :contributor, :any
      can [:read, :create, :update], Article

    else
      can :read, Article
    end
  end
end
