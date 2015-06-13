require 'test_helper'

class VolunteersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  fixtures :all

  setup do
    @user = create(:user, role_id: 1)
    sign_in @user
  end

  def teardown
    User.delete_all
  end

  test "the truth" do
     assert true
  end

  test "no route like /volunteers exist" do
	assert_raises(ActionController::UrlGenerationError) do
   	   get :index
	end
  end

end
