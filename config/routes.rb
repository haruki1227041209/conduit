Rails.application.routes.draw do
  get 'article_page/index'
  get 'article_page/show'
  get 'article_page/new'
  get 'article_page/edit'
  get 'home_page/index'
  root "home_page#index"
end
