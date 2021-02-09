require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get admin_url
    assert_response :success
  end

  test "should prompt for login" do
    get login_url
    assert_response :success
  end

  test "should login" do
    alonsinho = users(:one)
    post login_url, params: { name: alonsinho.name, password: 'secret' }
    assert_redirected_to admin_url
    assert_equal alonsinho.id, session[:user_id]
  end

  test "should fail login" do
    alonsinho = users(:one)
    post login_url, params: { name: alonsinho.name, password: 'wrong' }
    assert_redirected_to login_url
  end

  test "should logout" do
    delete logout_url
    assert_redirected_to store_index_url
  end

end