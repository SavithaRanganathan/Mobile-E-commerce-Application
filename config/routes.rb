Rails.application.routes.draw do
  get 'cameras/index'

  get 'cameras/new'

  get 'cameras/create'

  get 'cameras/show'

  get 'cameras/edit'

  get 'cameras/update'

  get 'cameras/destroy'

  get 'operating_systems/index'

  get 'operating_systems/new'

  get 'operating_systems/create'

  get 'operating_systems/show'

  get 'operating_systems/edit'

  get 'operating_systems/update'

  get 'operating_systems/destroy'

  get 'processors/index'

  get 'processors/new'

  get 'processors/create'

  get 'processors/show'

  get 'processors/edit'

  get 'processors/update'

  get 'processors/destroy'

  get 'storages/index'

  get 'storages/new'

  get 'storages/create'

  get 'storages/show'

  get 'storages/edit'

  get 'storages/update'

  get 'storages/destroy'

  get 'models/index'

  get 'models/new'

  get 'models/create'

  get 'models/show'

  get 'models/edit'

  get 'models/update'

  get 'models/destroy'

  get 'manufacturers/index'

  get 'manufacturers/new'

  get 'manufacturers/create'

  get 'manufacturers/show'

  get 'manufacturers/edit'

  get 'manufacturers/update'

  get 'manufacturers/destroy'

  get "/manufacturers", to: "manufacturers#index"

  resources :manufacturers 
  resources :cameras
  resources :models
  resources :storages
  resources :processors
  resources :operating_systems

  root  'models#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
