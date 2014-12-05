class IndexController < ApplicationController
  include PushServer
  skip_before_filter :authenticate!

  def about
    render :json => {
      name: 'Episketch',
      description: 'Share ideas with storyboards and sketches.',
      info: 'http://episketch.com/',
      push: "#{push_server_uri}"
    }
  end
end
