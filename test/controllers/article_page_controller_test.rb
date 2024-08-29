require "test_helper"

class ArticlePageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get article_page_index_url
    assert_response :success
  end

  test "should get show" do
    get article_page_show_url
    assert_response :success
  end

  test "should get new" do
    get article_page_new_url
    assert_response :success
  end

  test "should get edit" do
    get article_page_edit_url
    assert_response :success
  end
end
