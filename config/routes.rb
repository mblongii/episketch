Rails.application.routes.draw do
  get 'sketch/show'

  get 'storyboard/show'

  root 'storyboard#show'
end
