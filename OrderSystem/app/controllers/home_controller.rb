class HomeController < ApplicationController
  helper ApiHelper

  def index
  end

  def clients
    @clients = helpers.connect_api(action = 'get',
                                    url = "http://localhost:3000/api/v1/clients",
                                    params = [])
  end
end
