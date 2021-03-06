Jahu::Application.routes.draw do

  resources :tracks


  resources :songs
  resources :genres
  # root :to => 'songs#index'
  resources :sessions
  resources :users
  resources :tracks
  resources :compilations
  resources :contributions
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: "sessions#new", as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  match '/you',           :to => 'home#show',    :as => :you
  match '/you/update',    :to => 'home#update',  :as => :you_update

  #put 'add_collaborator', to: 'songs#add_collaborator', as: 'add_collaborator'

  match 'songs/:id/select_collaborator' => 'songs#select_collaborator', :as => :select_collaborator
  match 'songs/:id/add_collaborator' => 'songs#add_collaborator', :as => :add_collaborator, :via => :put

  match '/soundcloud/connect',    :to => 'soundcloud#connect',    :as => :soundcloud_connect
  match '/soundcloud/connected',  :to => 'soundcloud#connected',  :as => :soundcloud_connected
  match '/soundcloud/disconnect', :to => 'soundcloud#disconnect', :as => :soundcloud_disconnect

  root :to => "home#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
