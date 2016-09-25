Rails.application.routes.draw do

  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'

  get '/map' => 'checkins#index'

  root 'checkins#index'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users

  resources :checkins

end
