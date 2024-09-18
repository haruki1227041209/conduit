Rails.application.routes.draw do
  resources :article_page, only: [:index, :show, :new, :edit, :update]

  post 'article_pages', to: 'article_page#create'
  get 'article_page/delete/:id', to: 'article_page#destroy', as: 'delete_article_page'
  root "article_page#index"

  namespace :api do
    resources :users, only: [:create, :update]
    get '/users', to: 'users#index'
    post '/login', to: 'authentication#login'

    get '/articles/:slug', to: 'articles#show'
    post '/articles', to: 'articles#create'
  end
end
