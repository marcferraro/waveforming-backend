Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # namespace :api do 
    # namespace :v1 do
      resources :users
      resources :inputs
      resources :ooutputs
      resources :colors
      resources :stars
      
      patch '/avatar/:id', to: 'users#set_avatar'
      patch '/username/:id', to: 'users#set_avatar'

      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
    # end
  # end

end
