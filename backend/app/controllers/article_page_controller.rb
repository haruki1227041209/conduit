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
    tag_list_array = tag_list_param.split(',')

    @article = ArticlePage.new(article_params.merge(tag_list: tag_list_array))
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = ArticlePage.find(params[:id])
  end

  def update
    @article = ArticlePage.find(params[:id])
    tag_list_param = params[:article_page][:tag_list]
    tag_list_array = tag_list_param.split(',')

    if @article.update(article_params.merge(tag_list: tag_list_array))
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = ArticlePage.find(params[:id])
    @article.destroy
    redirect_to article_page_index_path
  end

  private

  def article_params
    params.require(:article_page).permit(:title, :description, :body, :tag_list)
  end
end
