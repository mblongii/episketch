Rails.application.routes.draw do
  get 'swatch-test/index'

  get 'sketch/show'

  get 'storyboard/show'

  root 'storyboard#show'
end
