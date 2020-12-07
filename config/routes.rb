Rails.application.routes.draw do
  resources :songs, only: [:index, :new, :create, :update, :show, :edit, :destroy]
end
