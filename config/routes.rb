Rails.application.routes.draw do
  resources :clubs
  root to: 'clubs#index'
  post 'clubs/hashtag'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
