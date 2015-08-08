# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
   navigation.selected_class = 'active'

  # Define the primary navigation
  navigation.items do |primary|

    if current_user and current_user.has_any_role? :superadmin, :admin
      primary.item :posts, "Posts", installations_path, highlights_on: :subpath do |sub|
        sub.dom_class = 'nav nav-pills'
        sub.item :photos, 'New post', new_installation_path
      end
    end

    if current_user and current_user.has_any_role? :superadmin, :admin, {name: :volunteer, resource: :any}
      primary.item :sites, "Sites", sites_path, highlights_on: :subpath do |sub|
        sub.dom_class = 'nav nav-pills'
        sub.item :photos, 'New site', new_site_path
      end
    end

    if current_user and current_user.has_any_role? :superadmin, :admin, {name: :volunteer, resource: :any}
      primary.item :languages, "Languages", languages_path, highlights_on: :subpath do |sub|
        sub.dom_class = 'nav nav-pills'
        sub.item :photos, 'New language', new_language_path
      end
    end

    if current_user and current_user.has_any_role? :superadmin, :admin, {name: :volunteer, resource: :any}
      primary.item :category, "Category", categories_path, highlights_on: :subpath do |sub|
        sub.dom_class = 'nav nav-pills'
        sub.item :category, 'New Category', new_category_path
      end
    end

    if current_user and current_user.has_any_role? :superadmin, :admin
      primary.item :organization, "Organization", organizations_path, highlights_on: :subpath do |sub|
        sub.dom_class = 'nav nav-pills'
        sub.item :organization, 'New Organization', new_organization_path
      end
    end

    primary.dom_class = 'nav'
  end
end
