Rails.application.routes.draw do
  namespace :api do
    get 'comments/create'
  end
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    resources :articles, only: [:index, :show]
    resources :comments
  end
end
