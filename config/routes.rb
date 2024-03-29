Erp::Application.routes.draw do
  resources :refunds


  resources :settings


  resources :expense_types


  devise_for :users do 
    authenticated :user do
      root :to => 'dashboards#index'
    end

    unauthenticated :user do
      root :to => 'devise/sessions#new'
    end
  end
  scope "/admin" do
    resources :users
  end
  
  match 'expenses/update_expenses_types_select/', to: 'expenses#update_expenses_types_select', as: 'expense_type_select'
  match 'expenses/find_expenses/', to: 'expenses#find_expenses', as: 'find_expenses'
  match 'expenses/find_expenses_for_excel', to: 'expenses#find_expenses_for_excel', as: 'find_expenses_for_excel', :defaults => { :format => 'xls' }
  match 'expenses/find_expenses_form/', to: 'expenses#find_expenses_form', as: 'find_expenses_form'
  match 'expenses/find_expenses_excel_form', to: 'expenses#find_expenses_excel_form', as: 'find_expenses_excel_form'



  resources :expenses
  resources :jobs
  resources :expense_types
  resources :dashboards, :path => "dashboard", :only => [:index]
  resources :settings, :only => [:index]
  root :to => 'dashboards#index'

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
