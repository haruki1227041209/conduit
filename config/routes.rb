Rails.application.routes.draw do
  get 'article_page/index'
  get 'article_page/show'
  get 'article_page/new'
  get 'article_page/edit'
  root "article_page#index"
end
