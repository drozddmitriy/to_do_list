Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: :create
      resource :authentications, only: %i[create destroy]

      resources :projects do
        resources :tasks, shallow: true do
          resources :comments
        end
      end
    end
  end
end
