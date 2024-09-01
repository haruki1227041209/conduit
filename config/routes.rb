Rails.application.routes.draw do
  resources :article_page, only: [:index, :show, :new, :edit, :update, :destroy]

  post 'article_pages', to: 'article_page#create'
  root "article_page#index"
end
