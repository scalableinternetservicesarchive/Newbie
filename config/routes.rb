Rails.application.routes.draw do

  get 'favorite_post/show'

  get 'index/index'

  get 'users/profile/edit' => 'users/profiles#editProfile'
  patch 'users/profile/edit' => 'users/profiles#updateProfile'
  get 'users/profile' => 'users/profiles#showCurrentUserProfile'
  get 'users/profile/:id' => 'users/profiles#showOtherUserProfile'

  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations" }
  resources :votes
  resources :posts do
    resources :comments
    put :favorite, on: :member
  end
  get 'allpost/' => 'posts#listOwnPost'
  get 'allpost/:id' => 'posts#listUserPost'
  get 'votepost/up/:id' => 'posts#upvote'
  get 'votepost/down/:id' => 'posts#downvote'
  resources :tag
  root 'index#index'

  get 'about' => 'index#about'
  get 'contact' => 'index#contact'
  get 'search' => 'index#search'

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
