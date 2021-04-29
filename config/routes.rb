Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "alarms#index"
  resources :alarms, only: [:index, :new, :create, :destroy]
  get "alarms/start", to: "alarms#start"
  get "alarms/end", to: "alarms#end"
  resources :memos, only: [:index, :create]
end
