Rails.application.routes.draw do
  get 'storyboard/show'

  root 'static_pages#index'
end
