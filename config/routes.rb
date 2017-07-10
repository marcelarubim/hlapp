Rails.application.routes.draw do
  root to: 'sessions#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, only: [:show, :edit, :update]

  resources :clients, except: [:show, :edit], shallow: true do
    resources :contracts, except: [:show, :edit] do
      resources :ops, except: [:show, :edit]
      resources :installations, except: [:show, :edit]
    end
  end
  get 'clients/:id', to: 'clients#edit'
  get 'contracts/:id', to: 'contracts#edit'
  get 'ops/:id', to: 'ops#edit'
  get 'installations/:id', to: 'installations#edit'
  scope 'installations/:installation_id' do
    resources :osts, except: [:show, :edit]
    get 'osts/:id', to: 'osts#edit'
  end
  get 'add', to: 'application#add_object', as: 'add_object'
  delete ':class_name/:id', to: 'application#destroy_object', as: 'destroy_object'
  scope :query do
    get 'clients/categories', to: 'filter#client_categories'
    get 'services/products', to: 'filter#service_products'
    get 'services/variations', to: 'filter#service_variations'
    get 'productions/op', to: 'filter#productions_available'
  end
end
