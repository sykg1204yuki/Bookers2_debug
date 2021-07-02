Rails.application.routes.draw do

  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update] do
    #-------ここからフォロー・フォロワー機能------
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as:'followings'
    get 'followers' => 'relationships#followers', as:'followers'

    #-------ここまでネストさせる-----------------
  end
  resources :books



end