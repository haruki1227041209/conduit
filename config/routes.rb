Rails.application.routes.draw do
  get 'home_page/index'
  root "home_page#index"
end
