Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, layout: 'admin'

  namespace :admin do
    root 'menu_type_searches#index', as: 'root'
    resources :menu_type_searches, :menus, :restaurants, :cities
  end

  get 'scrape', to: 'scrapers#scrape'

  get 'search(/:action)', controller: 'search', action: :action, as: "search"

  resources :cities, :only => [:index, :create, :new]

  resources :cities, :path => '', :except => [:index, :create, :new]
  resources :cities, :path => '', :only => [] do
    resources :restaurants, :path => '', :except => [:index]
    resources :restaurants, :path => '', :only => [] do
      resources :menus, :path => '', :except => [:index]
    end
  end

end
