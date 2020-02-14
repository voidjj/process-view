require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user_one)
  end

  test "login page" do
    get login_path
    assert_response :success
  end

  test "invalid login" do
    post login_path, params: { session: { email: @user.email,
                                         password: "" } }
    assert_response :success
  end

  test "valid login and logout" do
    post login_path, params: { session: { email: @user.email,
                                         password: "password" } }
    assert is_user_logged?
    assert_redirected_to root_path
    delete logout_path
    assert_not is_user_logged?
    assert_redirected_to login_path
  end
end
