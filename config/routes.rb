Appenings::Application.routes.draw do
  devise_for :users

  get "login/index"

  resources :friends do
    get :add, :on => :member
    get :remove, :on => :member
  end

  resources :appenings do
    get :story, :on => :member
    get :cancel, :on => :collection
    get :feed, :on => :collection
    post :accomplish, :on => :member
    post :copy, :on => :member
    resources :comments do
      get :cancel, :on => :collection
    end
    resources :pictures do
      post :upload, :on => :collection
      post :remove, :on => :member
    end
  end

  root :to => "login#index"

  devise_scope :user do
    get "/login" => "devise/sessions#new"
  end

  devise_scope :user do
    get "/logout" => "devise/sessions#destroy"
  end

  match "feed" => "feed#show"
  match "remove_feed/:appening_id" => "feed#remove"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
