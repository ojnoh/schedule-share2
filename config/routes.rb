Rails.application.routes.draw do
  get 'inquiry/index'   #入力画面
  post 'inquiry/confirm' #確認画面
  post 'inquiry/thanks'  #送信確認画面
  get "search" => "searches#search"  #検索用ルート
  devise_for :users
  root to: 'homes#top'

  resources :users do
    resource :favorites, only: [:create, :destroy]
  end
  resources :events

end
