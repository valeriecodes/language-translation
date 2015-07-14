ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Posts" do
          Installation.unscoped.order("installation").map do |post|
            li link_to(post.installation, admin_post_path(post))
          end
        end
      end

      column do
        panel "Sites" do
          Site.unscoped.order("installation_id").map do |site|
            li link_to(site.name + " (" + Installation.find(site.installation_id).installation + ")", admin_post_path(site))
          end
        end
      end
    end

    columns do
      column do
        panel "Languages" do
          ul do
            Language.unscoped.order("name").map do |language|
              li link_to(language.name, admin_language_path(language))
            end
          end
        end
      end

      column do
        panel "Categories" do
          ul do
            Category.unscoped.order("name").map do |category|
              li link_to(category.name, admin_category_path(category))
            end
          end
        end
      end

      column do
        panel "Articles" do
          ul do
            Article.unscoped.order("updated_at").last(20).map do |article|
              li link_to(article.english + " (" + Language.find(article.language_id).name + ", " + Category.find(article.category_id).name + ")", admin_article_path(article))
            end
          end
        end
      end

      # column do
      #   panel "Info" do
      #     para "Welcome to ActiveAdmin."
      #   end
      # end
    end
  end # content
end
