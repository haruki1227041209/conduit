class ArticlePageController < ApplicationController
  def index
    @articles = ArticlePage.all
  end

  def show
    @article = ArticlePage.find(params[:id])
  end

  def new
  end

  def edit
  end
end
