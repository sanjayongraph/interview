InterviewTool::Application.routes.draw do
  
  get "admin/dashboard"
  #get "admin/users_new"
  get "admin/users"
  get "users/dashboard"
 

 resources :session, only: [:new, :create, :destroy]
 
 resources :admin, only:[:new,:create,:destroy,:edit,:update]
 resources :category,only:[:destroy,:edit,:update,:show]
 resources :question,only:[:destroy,:edit,:update,:show]

 #match '/signup',  to: 'users#new',            via: 'get'
 match '/login',   to: 'session#new',           via: 'get'
 match '/signup',  to: 'users#new',             via: 'get'
 match '/signout', to: 'session#destroy',       via: 'delete'
 get  '/admin/users/new' => 'admin#users_new'
 get  '/admin/categories' => 'category#show'
 get  '/admin/categories/new' => 'category#new'
 post '/admin/categories/new' => 'category#create'                                                                                                                        
 get  '/admin/categories/question/new' => 'question#new'
 post '/admin/categories/question/new' => 'question#create' 
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'session#new'
  
  
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
