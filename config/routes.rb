Rails.application.routes.draw do

  root 'static_pages#home'

  get 'scrape', to: 'scrapers#scrape'

  get 'search/:action' => 'search#:action'

  resources :cities, :only => [:index, :create, :new]

  resources :cities, :path => '', :except => [:index, :create, :new]
  resources :cities, :path => '', :only => [] do
    resources :restaurants, :path => '', :except => [:index]
    resources :restaurants, :path => '', :only => [] do
      resources :menus, :path => '', :except => [:index]
    end
  end

end
