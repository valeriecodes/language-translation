# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
   navigation.selected_class = 'active'

  # Define the primary navigation
  navigation.items do |primary|
    primary.item :users, 'Members', users_path, highlights_on: :subpath if current_user and current_user.has_any_role? :admin, :volunteer
    
    primary.item :posts, "Posts", installations_path, highlights_on: :subpath do |sub|
      sub.dom_class = 'nav nav-pills'
      sub.item :photos, 'New post', new_installation_path
    end  if current_user and current_user.has_role? :admin

    primary.item :sites, "Sites", sites_path, highlights_on: :subpath do |sub|
      sub.dom_class = 'nav nav-pills'
      sub.item :photos, 'New site', new_site_path
    end  if current_user and current_user.has_any_role? :admin, :volunteer

    primary.item :languages, "Languages", languages_path, highlights_on: :subpath do |sub|
      sub.dom_class = 'nav nav-pills'
      sub.item :photos, 'New language', new_language_path
    end  if current_user and current_user.has_any_role? :admin, :volunteer

    primary.item :category, "Category", categories_path, highlights_on: :subpath do |sub|
      sub.dom_class = 'nav nav-pills'
      sub.item :category, 'New photo', new_category_path 
    end  if [:admin].include?(current_user.try(:role))

    primary.item :photos, "Photos", articles_path, highlights_on: :subpath do |sub|
      sub.dom_class = 'nav nav-pills'
      sub.item :photos, 'New photo', new_article_path 
    end  if current_user and current_user.has_any_role? :admin, :volunteer, :contributor

    primary.dom_class = 'nav'
  end
end
