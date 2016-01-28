Rails.application.routes.draw do
  resources :nbaplayers
  resources :sessions, only: [:new, :create, :destroy, :list]
  resource :lineups
  resources :lineup_items
  resources :nbaplayers do
    resources :lineup_items
  end

  post '/add_lineup_item' => 'nbaplayers#add_lineup_item'
  get '/add_pg1' => 'lineups#add_pg1'
  get '/add_pg2' => 'lineups#add_pg2'
  get '/add_sg1' => 'lineups#add_sg1'
  get '/add_sg2' => 'lineups#add_sg2'
  get '/add_sf1' => 'lineups#add_sf1'
  get '/add_sf2' => 'lineups#add_sf2'
  get '/add_pf1' => 'lineups#add_pf1'
  get '/add_pf2' => 'lineups#add_pf2'
  get '/add_c' => 'lineups#add_c'
  get '/list' => 'nbaplayers#list'
  get '/sign-in' => 'sessions#new'
  delete '/sign-out' => 'sessions#destroy'
  get '/lineup' => 'lineup_items#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'nbaplayers#list'

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
