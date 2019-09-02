Rails.application.routes.draw do
  get 'logouts/show'

  get 'profiles/show'

  get 'mypages/show'

  get 'mypages/information', to: 'mypages#information'


  devise_for :users
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end
  root to: 'home#top'

  resources :items

  resources :maypages do
    resource :profile ,only: [:show]
  end
  
end
