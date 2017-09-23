Rails.application.routes.draw do
  resources :payments, only: [:new, :create] do
    post :webhook, on: :collection
  end
end
