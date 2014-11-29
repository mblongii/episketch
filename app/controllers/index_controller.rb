class IndexController < ApplicationController
  def about(rsp = HTTParty.get(ENV['BASE_URI']))
    response = JSON.parse(rsp.body)
    @description = response['description']
    @info = response['info']
    @push = response['push']
    @status = rsp.response["status"]
  end
end
