Rails.application.routes.draw do
  devise_for :users
  root to: "alarms#index"
  resources :alarms, only: [:index, :new, :create, :destroy]
  get "alarms/start", to: "alarms#start"
  get "alarms/end", to: "alarms#end"
  resources :memos, only: [:index, :create]
  resources :messages, only: [:new, :create]
end
