require 'test_helper'

class VolunteersControllerTest < ActionController::TestCase
  tests UsersController

  include Devise::TestHelpers

  fixtures :all

  setup do
    @user = users(:two)
    sign_in @user
  end

  def teardown
    sign_out(@user)

    User.delete_all
  end

  #test "the truth" do
  #  assert true
  #end

 #test "no route like /volunteers exist" do
 #  assert_raises(ActionController::UrlGenerationError) do
 #    get :index
 #  end
 #end

  test "Volunteers can view users list #index" do
    get :index

    assert_template :index
    
    puts User.all.map(&:role_id).to_json
    assert_equal 2, assigns(:users).count, ""
  end

end
