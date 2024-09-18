require 'test_helper'

class Api::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should create user" do
    post api_users_url,
          params: { user: { username: 'new_user', email: 'newuser@example.com', password: 'password123' } }

    assert_response :success
    assert_equal 'new_user', json_response['user']['username']
    assert_equal 'newuser@example.com', json_response['user']['email']
  end

  private

  def json_response
    JSON.parse(@response.body)
  end
end
