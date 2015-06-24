require 'test_helper'

class LanguagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  tests LanguagesController

  fixtures :all

  setup do
    @user = create(:user) #role
    sign_in @user
  end

  def teardown
    User.delete_all
  end

  test "the truth" do
     assert true
  end

  test "index should render correct template and layout" do
    get :index

    assert_template :index
    assert_template layout: "layouts/application"
  end

  test "should create language and go to its show page" do
    assert_difference('Language.count') do
        post :create, language: {name: 'Chuukese'}
    end
    assert_redirected_to language_path(assigns(:language))
  end

  test "should not create language without its name" do
    assert_no_difference('Language.count') do
        post :create, language: {name: nil}
    end
  end

  test "should delete language along with all photos under that language" do
    language = Language.create!({name: 'Sanskrit'})
    article = Article.create!({language_id: language.id, category: 'Weapon', english: "Foods", phonetic: "Keema" })

    assert_difference('Language.count',-1) do
      delete :destroy, id: language.id
      assert_response :redirect
    end

    assert_nil Language.find_by_id(language.id)
    assert_nil Article.find_by_language_id(language.id)
    assert_nil Article.find_by_id(article.id)
  end

end
