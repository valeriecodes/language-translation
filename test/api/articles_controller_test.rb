require "test_helper"

class ArticlesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  tests API::ArticlesController

  def setup
    #@request.host = "test.plt.local"
    @user     = users(:one)
  end

  def teardown
    User.delete_all
    Article.delete_all
  end

  describe "Get #index" do
    describe "when all article renders" do
      before(:each) do
        3.times {
          create(:article)
        }
      end

      it "return 3 items" do
        get :index, {format: :json, auth_token: @user.authentication_token }

        assert_equal 200, response.status
        assert_equal 3, json_response["articles"].length
      end
    end
  end

end
