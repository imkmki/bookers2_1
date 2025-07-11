Rails.application.routes.draw do
  root to: 'homes#top'
  get 'about' => 'homes#about'

  devise_for :users  # ← これが必要！

  resources :books
  resources :users, only: [:index, :show, :edit, :update]
end