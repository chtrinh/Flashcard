Flashcard::Application.routes.draw do
  resources :words do 
    resources :mnemonics, :only => [:create, :index, :update, :show, :destroy]
  end
  
  # match 'words/:word_id/mnemonics' => "mnemonics#index", :as => 
  # match 'words/:word_id/mnemonics/:id' => "mnemonics#show"
  
  match 'wordnik/definitions/:id' => 'wordnik#definitions'
  match 'wordnik/flashcard/:id' => 'wordnik#flashcard'
  match 'wordnik/example/:id' => 'wordnik#example'
  match 'wordnik/audio/:id' => 'wordnik#audio'
  
  match 'quiz/fill/:id' => 'quiz#fill'
  match 'quiz/result' => 'quiz#result'
  
  match "/auth/:provider/callback" => "sessions#create"
  match "/auth/facebook", :as => :signin
  match "/signout" => "sessions#destroy", :as => :signout
  
  match "/learn" => "hub#learn", :as => :learn
  match "/memorize" => "hub#memorize", :as => :memorize
  match "/quiz" => "hub#quiz", :as => :quiz
  
  root :to =>"hub#index"
  
  
  # resources :users do 
  #   resources :mnemonics
  # end
  

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
