Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'

  get '/map' => 'maps#show'

  root 'static_pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users

end
