Rails.application.routes.draw do
  resources :sketches, except: [:new, :edit]
  root 'index#about'

  controller :login do
    get 'login',            action: :new
    post 'login',           action: :create
    delete 'logout',        action: :destroy
  end

  resources :sketches,      only: [:show]

  resources :designers do
    resources :storyboards, only: [ :index, :show, :create, :update]
    resources :sketches,    only: [ :index, :show, :create, :update]
  end

  resources :storyboards do
    get 'viewers',          on: :member, action: :get_viewers
    put 'viewer',           on: :member, action: :set_viewer
    get 'participants',     on: :member, action: :get_participants
    post 'invite',          on: :member, action: :invite

    resources :designers,   only: [:index, :show, :create]
    resources :sketches,    only: [:index, :show]
  end
end
