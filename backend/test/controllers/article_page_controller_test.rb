require "test_helper"

class ArticlePageControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Conduit"
    @article_page = article_pages(:one)
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "home | #{@base_title}"
  end

  test "should get new" do
    get new_article_page_path
    assert_response :success
    assert_select "title", "new | #{@base_title}"
  end

  test "should get show" do
    get article_page_path(@article_page.id)  # id を渡す
    assert_response :success
    assert_select "title", "show | #{@base_title}"
  end

  test "should get edit" do
    get edit_article_page_path(@article_page.id)  # id を渡す
    assert_response :success
    assert_select "title", "edit | #{@base_title}"
  end
end
