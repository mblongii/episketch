Rails.application.routes.draw do
  get 'storyboard/show'

  root 'storyboard#show'
end
