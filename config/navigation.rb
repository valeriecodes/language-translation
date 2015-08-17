# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
   navigation.selected_class = 'active'

  # Define the primary navigation
  navigation.items do |primary|
    primary.dom_class = 'MainMenu sidebarNav'
    
    if current_user and current_user.has_any_role? :superadmin, :admin, {name: :volunteer, resource: :any}
      primary.item :users, 'Members', users_path, highlights_on: :subpath
    end

    if current_user and current_user.has_any_role? :superadmin, :admin, {name: :volunteer, resource: :any}, {name: :contributor, resource: :any}
      primary.item :photos, "Photos", articles_path, highlights_on: :subpath do |sub|
        sub.dom_class = 'nav nav-pills'
        sub.item :new_photo, 'New photo', new_article_path
      end
    end
  end
end
