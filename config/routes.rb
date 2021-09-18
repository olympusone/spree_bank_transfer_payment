Spree::Core::Engine.add_routes do
  namespace :admin, path: Spree.admin_path do
    resources :orders, except: [:show] do
      resources :payments do
        patch :banktransfer, on: :member
      end
    end
  end
end
