Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :users
      resources :sessions, only: [:create]
      resources :pages, only: [:index]
    end
  end
end
