ManPtsRor::Application.routes.draw do
  get "home/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  devise_for :users, :controllers => { :sessions => :sessions }

  devise_scope :users do 
    get       "login",          :to => "users/sessions#new" 
    post      "login",          :to => "users/sessions#create" 
    delete    "logout",         :to => "users/sessions#destroy" 
    get       "session",        :to => "users/sessions#show" 
  end 

  resources :users 
  resources :sessions, only: [:new, :create, :destroy]
  resources :activities do
    resources :ratings
  end

  match '/signup', to: 'users#new',  via: 'get'
#  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/rate', to: 'ratings#new', via: 'get'
  match '/rate', to: 'activities#index', via: 'post'
  #match '/stars', to: 'home#rating', via: 'get'

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
