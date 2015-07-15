require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  tests ArticlesController

  include Devise::TestHelpers

  setup do
    @user = create(:user)
    @user.add_role :admin
    @language = create(:language, name: 'Chuukese')
    sign_in @user
  end

  def teardown
    User.delete_all
    Article.delete_all
  end

  test "the truth" do
     assert true
  end

  test "index should render correct template and layout" do
    get :index

    assert_template :index
    assert_template layout: "layouts/application"
  end

  test "should create photo and go to its show page" do
    category = create(:category)

    assert_difference('Article.count') do
      post :create, article: {
        category_id: category.id, 
        english: 'Knife', 
        phonetic: "Pihiya", 
        language_id: @language.id, 
        picture: Rack::Test::UploadedFile.new(File.join(Rails.root, 'test', 'support', 'picture', 'logo.jpg')),
        state: "published"
      }
    end
    
    assert_redirected_to article_path(assigns(:article))

    assert_equal "published", assigns(:article).state
  end

  test "should delete photo" do
    category = create(:category)

    article = Article.create!({
      language_id: @language.id, 
      category_id: category.id, 
      english: "Foods", 
      phonetic: "Keema", 
      picture: Rack::Test::UploadedFile.new(File.join(Rails.root, 'test', 'support', 'picture', 'logo.jpg'))
    })

    assert_difference('Article.count',-1) do
      delete :destroy, language_id: @language.id, id: article.id
      assert_response :redirect
    end

    assert_nil Article.find_by_id(article.id)
    assert_not_nil Language.find_by_id(@language.id)
  end

end
