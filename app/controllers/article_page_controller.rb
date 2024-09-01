class ArticlePageController < ApplicationController
  def index
    @articles = ArticlePage.all
  end

  def show
    @article = ArticlePage.find(params[:id])
  end

  def new
    @article = ArticlePage.new
  end

  def create
    tag_list_param = params[:article_page][:tag_list]
    tag_list_array = tag_list_param.is_a?(String) ? tag_list_param.split(',') : tag_list_param

    @article = ArticlePage.new(article_params.merge(tag_list: tag_list_array))
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  private

  def article_params
    params.require(:article_page).permit(:title, :description, :body, :tag_list)
  end
end
