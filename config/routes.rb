Rails.application.routes.draw do
  # resources :cities do
  #   resources :restaurants do
  #     resources :menus
  #   end
  # end

  get 'scrape', to: 'scrapers#scrape'

  resources :cities, :only => [:index, :create, :new]

  resources :cities, :path => '', :except => [:index, :create, :new]
  resources :cities, :path => '', :only => [] do
    resources :restaurants, :path => '', :except => [:index]
    resources :restaurants, :path => '', :only => [] do
      resources :menus, :path => '', :except => [:index]
    end
  end

end
