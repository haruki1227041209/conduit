Rails.application.routes.draw do
  get 'article_page/index'
  get 'article_page/show/:id', to: 'article_page#show', as: 'article_page_show'
  get 'article_page/new'
  get 'article_page/edit'
  root "article_page#index"
end
