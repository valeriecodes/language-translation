# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
   navigation.selected_class = 'active'

  # Define the primary navigation
  navigation.items do |primary|
    if current_user and current_user.has_any_role? :superadmin, :admin, {name: :volunteer, resource: :any}
      primary.item :users, 'Members', users_path, highlights_on: :subpath do |sub|
        sub.dom_class = 'nav nav-pills'
        sub.item :user, 'Invite Member', new_user_path
      end
    end

    if current_user and current_user.has_role? :superadmin
      primary.item :organizations, "Organizations", organizations_path, highlights_on: :subpath do |sub|
        sub.dom_class = 'nav nav-pills'
        sub.item :new_organization, 'New Organization', new_organization_path
      end
    end

    if current_user and current_user.has_role? :admin
      primary.item :organization, "My Organization", organization_path(current_user.organization)
    end

    if current_user and current_user.has_any_role? :superadmin, :admin
      primary.item :countries, "Countries", countries_path, highlights_on: :subpath do |sub|
        sub.dom_class = 'nav nav-pills'
        sub.item :countries, 'New country', new_country_path
      end
    end

    if current_user and current_user.has_any_role? :superadmin, :admin
      primary.item :sites, "Sites", sites_path, highlights_on: :subpath do |sub|
        sub.dom_class = 'nav nav-pills'
        sub.item :new_site, 'New site', new_site_path
      end
    end

    if current_user and current_user.has_role? :volunteer, :any
      primary.item :sites, "My Site", site_path(Site.with_role(:volunteer, current_user).first)
    end

    if current_user and current_user.has_any_role? :superadmin, :admin, {name: :volunteer, resource: :any}
      primary.item :languages, "Languages", languages_path, highlights_on: :subpath do |sub|
        sub.dom_class = 'nav nav-pills'
        sub.item :new_language, 'New language', new_language_path
      end
    end

    if current_user and current_user.has_any_role? :superadmin, :admin, {name: :volunteer, resource: :any}
      primary.item :categories, "Categories", categories_path, highlights_on: :subpath do |sub|
        sub.dom_class = 'nav nav-pills'
        sub.item :new_category, 'New Category', new_category_path
      end
    end

    if current_user and current_user.has_any_role? :superadmin, :admin, {name: :volunteer, resource: :any}, {name: :contributor, resource: :any}
      primary.item :photos, "Photos", articles_path, highlights_on: :subpath do |sub|
        sub.dom_class = 'nav nav-pills'
        sub.item :new_photo, 'New photo', new_article_path
      end
    end

    primary.dom_class = 'nav'
  end
end
