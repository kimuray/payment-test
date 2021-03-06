Rails.application.routes.draw do
  resources :payments, only: [:new, :create, :destroy] do
    post :webhook, on: :collection
    patch :restart, on: :member
  end
end
