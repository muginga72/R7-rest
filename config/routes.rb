Rails.application.routes.draw do
  resources :users
  devise_for :users,
    controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  post '/users/sign', to: 'users#sign'
  post '/users/sign_out', to: 'users#sign_out'
  get '/test', to: 'test#show'

  namespace :api do
    namespace :v1 do
      resources :members do
        resources :facts
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
