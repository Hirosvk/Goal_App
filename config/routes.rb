Rails.application.routes.draw do
  resources :goals, only: [:create, :destroy, :edit]
  resources :users do
    resources :goals, except: [:create, :destroy, :edit]
  end
  resource :session



end
