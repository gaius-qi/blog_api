Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :users
      resources :tags, only: [:index]
      resources :sessions, only: [:create]
      scope path: '/user/:user_id' do
        resources :pages, only: [:update, :destroy, :create]
      end
      resources :pages, except: [:update, :destroy, :create]
      get '/pages_date_total', to: 'pages#pages_date_total'
      get '/paging/:page_number', to: 'pages#paging'
    end
  end
end
