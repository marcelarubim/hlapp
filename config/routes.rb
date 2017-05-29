Rails.application.routes.draw do
  resources :clients, except: [:show, :edit], shallow: true do
    resources :contracts, except: [:show, :edit]
  end
  get 'clients/:id', to: 'clients#edit'
  get 'contracts/:id', to: 'contracts#edit'
  scope :query do
    get 'clients/categories', to: 'filter#client_categories'
  end
end
