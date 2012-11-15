PrRails::Application.routes.draw do

  resources :pages, :except => [:show, :update]

  resources :retailers do
    resources :locations
  end

  controller :quizzes do
    get 'quiz', :to => 'quiz#index'
    post 'quiz', :to => 'quiz#grade', :as => :grade_quiz
  end

  devise_for :users, path_names: { :sign_in => "login", :sign_out => "logout" }

  controller 'users' do
    get 'users', to: 'users#index'
    get 'users/invite-staff', to: 'users#invite_staff', as: :invite_staff
    post 'users/invite-staff', to: 'users#create_staff', as: :create_staff 
    get 'users/admins', to: 'users#admins', as: :admin_users
    get 'users/managers', to: 'users#managers', as: :manager_users
    get 'users/employees', to: 'users#employees', as: :employee_users
    get 'users/:id', to: 'users#show', as: :user
    get 'users/:id/edit', to: 'users#edit', as: :user_edit
    put 'users/:id', to: 'users#update'
  end
  
  get 'partner-resources',  :to => 'pages#partner_resources'
  get 'partner-faq',        :to => 'pages#partner_faq'
  get 'staff-training',     :to => 'pages#staff_training'
  get ':id', :to => 'pages#show', :as => :page
  put ':id', :to => 'pages#update', :as => :page
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
  root :to => 'pages#show', :id => "home"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
