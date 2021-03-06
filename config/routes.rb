Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'recipes#splash'
  
  resources :groups
  resources :group_users, only: [:new, :index, :create, :destroy]
  get '/add_user' => 'group_users#new'
  post '/add_user' => 'group_users#create'
 
 resources :images, only: [:destroy]

  resources :recipes do
    resources :comments, only: [:new, :create, :destroy]
    resources :images, only: [:new, :create, :destroy]
    collection { post :search, to: 'recipes#index' }
  end

  resources :tags, only: [:show]

  resources :group_recipes, only: [:new, :index, :create, :destroy]
  get '/add_group_recipe' => 'group_recipes#new'
  post '/add_group_recipe' => 'group_recipes#create'

  resources :recipe_tags, only: [:new, :index, :create, :destroy]
  get '/add_recipe_tag' => 'recipe_tags#new'
  post '/add_recipe_tag' => 'recipe_tags#create'

  resources :stories
  
  resources :recipe_stories, only: [:new, :index, :create, :destroy]
  get '/add_recipe_story' => 'recipe_stories#new'
  post '/add_recipe_story' => 'recipe_stories#create'

  resources :users do
    resources :images, only: [:new, :create, :destroy]
  end
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :sessions, only: [:new, :create, :destroy]
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy' 


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
