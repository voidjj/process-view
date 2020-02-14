require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user_one)
  end

  test "should get indroot page when logged" do
    post login_path, params: { session: { email: @user.email,
                                         password: "password" } }
    get root_path
    assert_response :success
  end

  test "should redirect to login on root page when not logged" do
    get root_path
    assert_redirected_to login_path
  end
end
