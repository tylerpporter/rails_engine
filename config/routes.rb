Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end

      namespace :merchants do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/most_revenue', to: 'revenue#index'
        get '/:id/revenue', to: 'revenue#show'
        get '/most_items', to: 'most_items#index'
      end

      resources :items, except: [:new, :edit]
      resources :merchants, except: [:new, :edit]

      get '/merchants/:id/items', to: 'relationships#index'
      get '/items/:id/merchant', to: 'relationships#show'

      get '/revenue', to: 'revenue#show'
    end
  end
end
