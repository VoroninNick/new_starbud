Rails.application.routes.draw do
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main#index'
  get 'about-company' => 'main#about_company', as: :about_company
  get 'about-company/:title' => 'main#vacancy', as: :vacancy


  get 'special-offers' => 'main#special_offers', as: :special_offers
  get 'special-offers/:title' => 'main#special_offer', as: :special_offer

  get 'publications' => 'main#publications', as: :publications
  get 'publications/:title' => 'main#publication', as: :publication
  get 'contacts' => 'main#contacts', as: :contacts

  post 'become-a-dealer' => 'main#become_a_dealer'
  post 'contact-us' => 'main#contact_us'
  get 'dev' => 'main#dev'

  scope "dashboard" do
    root 'dashboard#index', as: "dashboard"

    scope "doors" do
      root 'catalog#doors', as: "catalog_doors"
      get 'product/:title' => 'catalog#product', as: "product"
    end

    scope "cabinet" do
      root "cabinet#index", as: "cabinet"
      get 'balance' => 'cabinet#balance', as: "balance"
      get 'purchase-history' => 'cabinet#purchase_history', as: "purchase_history"
      get 'wish-list' => 'cabinet#wish_list', as: "wish_list"
      get 'education' => 'cabinet#education', as: "education"
      get 'financial-storage' => 'cabinet#financial_storage', as: "financial_storage"
    end

    scope "cart" do
      root "cart#index", as: "cart"
      get 'purchased' => 'cart#purchased', as: "purchased"
      get 'drafts' => 'cart#drafts', as: "drafts"
    end

  end

  # match '*args' => 'application#listener_1c', via: [:post, :get, :put]
  match '*args' => 'application#render_not_found', via: [:post, :get, :put]


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
