Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/merchants', to: 'merchants#index'
  namespace :merchants do
    get '/:id/items', to: 'items#index'
    get '/:id/items/:id', to: 'items#show'
  end

  get '/admin', to: 'admin#index'
  
  namespace :admin do
    get '/merchants', to: 'merchants#index'
    get '/invoices', to: 'invoices#index'
  end
end
