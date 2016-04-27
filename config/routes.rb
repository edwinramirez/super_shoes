Rails.application.routes.draw do
  resources :articles
  resources :stores
  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Custom routes for Rest services.
  get 'services/stores', :to => 'stores#service_index'
  get 'services/articles', :to => 'articles#service_index'
  get 'services/articles/stores/:id', :to => 'articles#service_articles_by_store'
end
