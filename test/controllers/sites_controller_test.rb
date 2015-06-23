require 'test_helper'

class SitesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = create(:user, role_id: 1)
    sign_in @user
  end

  def teardown
    User.delete_all
    Site.delete_all
  end

  test "the truth" do
     assert true
  end

  test "index should render correct template and layout" do
    get :index

    assert_template :index
    assert_template layout: "layouts/application"
  end

  test "should create site and go to its show page" do
    assert_difference('Site.count') do
        post :create, site: {name: 'Devoll'}
    end
    assert_redirected_to site_path(assigns(:site))
  end

  test "should not create language without its name" do
    assert_no_difference('Site.count') do
      post :create, site: {name: nil}
    end
  end

  test "should delete site along with all volunteers and contributors under it" do
    installation = Installation.create({installation: 'Azerbaijan'})
    site = Site.create!({installation_id: installation.id, name: 'Leh'})

    #volunteer = Volunteer.create({site_id: site.id, vname: 'Saumya'})
    #contributor = Contributor.create!({site_id: site.id, name: 'Dipika'})

    assert_difference('Site.count',-1) do
      delete :destroy, id: site.id
      assert_response :redirect
    end

    assert_nil Site.find_by_id(site.id)

    #assert_nil Volunteer.find_by_id(volunteer.id)
    #assert_nil Volunteer.find_by_site_id(site.id)
    #assert_nil Contributor.find_by_id(contributor.id)
    #assert_nil Contributor.find_by_site_id(site.id)

    assert_not_nil Installation.find_by_id(installation.id)
  end

end
