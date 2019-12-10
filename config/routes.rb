Rails.application.routes.draw do

  # resources :users, param: :_username
  # post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'

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
