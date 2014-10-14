class IndexController < ApplicationController
  include PushServer

  def about
    render :json => {
      description: 'Episketch: Share ideas with storyboards and sketches.',
      info: 'http://episketch.com/',
      push: "#{push_server_uri}"
    }
  end
end
