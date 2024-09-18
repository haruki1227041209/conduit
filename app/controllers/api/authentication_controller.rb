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
    post api_articles_url, params: { article: { title: 'Test Title', description: 'Test Description', body: 'Test Body', tag_list: ['test'] } }, headers: { 'Authorization': "Bearer #{@token}" }
    assert_response :created
    assert_equal 'Test Title', Article.last.title
  end

  test "should not create article with invalid attributes" do
    post api_articles_url, params: { article: { title: '', description: '', body: '', tag_list: ['test'] } }, headers: { 'Authorization': "Bearer #{@token}" }
    assert_response :unprocessable_entity
  end
end
