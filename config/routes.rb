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
      get '/pages_date_total',          to: 'pages#pages_date_total'
      get '/paging/:page_number',       to: 'pages#paging'
      get '/archive_pages/:date',       to: 'pages#archive_pages'
      get '/click_page/:id',            to: 'pages#click_page'
      get '/page_click_count/:id',      to: 'pages#page_click_count'
      get '/category',                  to: 'pages#category'
      get '/category_pages/:category',  to: 'pages#category_pages'
      get '/tag_pages/:tag_name',       to: 'tags#tag_pages'
    end
  end
end
