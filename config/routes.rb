Rails.application.routes.draw do
  root 'items#index'

  get 'information/show'

  get 'logouts/show'

  get 'profiles/show'

  get 'mypages/show'

  get 'mypages/information', to: 'mypages#information'


  devise_for :users
  resources :signup do
    collection do
      get 'step00'
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで、入力の全てが終了する
      get 'step5'
    end
  end
  root to: 'home#top'

  resources :items do
    collection do
      get "select", to: "items#select"
      get "select_grand", to: "items#select_grand"
      get "my_item/:id",to: "items#my_item"
    end
  end

  resources :categories, only: [:index]
  resources :purchases, only: [:index, :edit, :update]


  resource :mypages do
    resource :profile ,only: [:show]
    resource :logout ,only: [:show]
    resource :information ,only: [:show]
  end


  resources :credit_cards, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
      get  'get'  ,  to: 'credit_cards#add_card'
    end
  end

end
