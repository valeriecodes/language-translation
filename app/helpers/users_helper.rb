module UsersHelper
  def role_options(user)
    selected_roles = Role::ROLES.except(5)
    options_for_select(selected_roles.collect{ |id, name| [name.capitalize, id] }, user.role_id)
  end
end
