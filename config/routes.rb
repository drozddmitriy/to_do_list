Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, param: :_username
      post '/auth/login', to: 'authentication#login'

      root to: 'projects#index'

      resources :projects do
        resources :tasks
      end
    end
  end
end
