Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :artists, only: %i[index show] do
    member do
      get 'discography', to: 'artist_discography#show'
      put 'ingest'
    end
  end
  resources :labels, only: %i[index show]
  resources :masters, only: %i[index show] do
    member do
      put 'ingest'
    end
    get 'releases', to: 'master_releases#index'
    get 'releases/:media', to: 'master_releases#index'
  end
  resources :releases, only: %i[index show]
end
