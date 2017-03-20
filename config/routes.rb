Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :users
      resources :sessions, only: [:create]
      scope path: '/user/:user_id' do
        resources :pages, only: [:index, :create]
      end
      resources :pages, except: [:index, :create]
    end
  end
end
