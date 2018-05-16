Rails.application.routes.draw do
  resources :clubs
  root to: 'clubs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
