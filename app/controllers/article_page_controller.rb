class ArticlePageController < ApplicationController
  def index
    @articles = ArticlePage.all
  end

  def show
    @articles = ArticlePage.all
  end

  def new
  end

  def edit
  end
end
