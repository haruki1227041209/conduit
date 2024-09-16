Rails.application.routes.draw do
  resources :article_page, only: [:index, :show, :new, :edit, :update]

  post 'article_pages', to: 'article_page#create'
  get 'article_page/delete/:id', to: 'article_page#destroy', as: 'delete_article_page'
  root "article_page#index"

  namespace :api do
    get '/users', to: 'users#index'
    post '/users', to: 'users#create'
    post '/login', to: 'authentication#login'
  end
end
