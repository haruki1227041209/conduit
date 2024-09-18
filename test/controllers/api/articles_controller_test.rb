require 'test_helper'
require 'jwt'

class Api::ArticlesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(email: 'test@example.com', password: 'password')
    @token = generate_jwt_token(@user)
  end

  def generate_jwt_token(user)
    payload = { user_id: user.id, exp: 24.hours.from_now.to_i }
    secret_key = Rails.application.secrets.secret_key_base
    JWT.encode(payload, secret_key)
  end

  test "should create article with valid attributes" do
    post api_articles_url,
          params: { article: { title: 'Valid Title', description: 'Valid Description', body: 'Valid Body', tag_list: ['tag1', 'tag2'] } },
          headers: { 'Authorization': "Bearer #{@token}" }

    assert_response :created
    assert_equal 'Valid Title', Article.last.title
    assert_equal 'Valid Description', Article.last.description
    assert_equal 'Valid Body', Article.last.body
    assert_includes Article.last.tag_list, 'tag1'
    assert_includes Article.last.tag_list, 'tag2'
  end

  test "should not create article with invalid attributes" do
    post api_articles_url,
          params: { article: { title: '', description: '', body: '', tag_list: [''] } },
          headers: { 'Authorization': "Bearer #{@token}" }

    assert_response :unprocessable_entity
    assert_includes json_response['errors'], "Title can't be blank"
    assert_includes json_response['errors'], "Description can't be blank"
    assert_includes json_response['errors'], "Body can't be blank"
  end

  private

  def json_response
    JSON.parse(@response.body)
  end
end
