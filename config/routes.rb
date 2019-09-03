Rails.application.routes.draw do
  devise_for :users
  resources :signup do
    collection do
      get 'step0'
      get 'step00'
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで、入力の全てが終了する
      get 'step5'
      get 'step6'
    end
  end
  root to: 'home#top'

  resources :items

end
