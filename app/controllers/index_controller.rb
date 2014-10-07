class IndexController < ApplicationController
  def about
    render :json => {
      description: 'Episketch: Share ideas with storyboards and sketches.',
      info: 'http://episketch.com/'
    }
  end
end
