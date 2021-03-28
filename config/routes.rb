Rails.application.routes.draw do
  resources :ooutputs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :api do 
    namespace :v1 do
      resources :users
      
      patch '/avatar/:id', to: 'users#set_avatar'

      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
    end
  end

end
