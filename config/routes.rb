Rails.application.routes.draw do
  get 'profiles/show'

  get 'mypages/show'

  root to: 'home#top'

  resources :items

  resources :maypages do
    resource :profile ,only: [:show]
  end
  
end
