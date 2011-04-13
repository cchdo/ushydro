ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

 # Auth::Application.routes.draw do
 #   get "sign_up" => "users#new", :as => "sign_up"
 #   root :to => "users#new"
 #   resources :users
 # end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "home"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  #map.connect ':controller/:action/:id.:format', :format => 'html'
  map.connect ':controller.:format', :format => 'html'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  # map.connect 'outreach/:content', :controller => 'outreach', :action => 'content'

  # map.connect virtual_cruise_path => "/virtual_cruise/"
  
  # map.connect ':virtual_cruise', :controller => 'static', :action => 'rerout'
  # Mapping for static controller
  map.connect '*path', :controller => 'static'
  #Auth::Application.routes.draw do
   #map.connect "log_in" => "sessions#new", :as => "log_in"
   #map.connect "log_out" => "sessions#destroy", :as => "log_out"
   map.resources :events
   #map.connect "sign_up" => "users#new", :as => "sign_up"
   #root :to => "users#new"
   #resources :users
   #resources :sessions
  ##end
end
