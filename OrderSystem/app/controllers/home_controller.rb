class HomeController < ApplicationController
  helper ApiHelper
  skip_before_action :verify_authenticity_token
  before_action :get_clients, only:[:clients, :remove_client]

  def index
  end

  def clients
  end

  def client_new
  end

  def client_edit
    @client = helpers.connect_api(action = 'get', url = self.set_clients_url)
  end

  def send_client_edit
    @client = helpers.connect_api(action = 'put',
                                  url = self.set_clients_url,
                                  params = self.client_params
                                  )
    render json: @client.to_json
  end

  def send_client_new
    @client = helpers.connect_api(action = 'post',
                                  url = "http://localhost:3000/api/v1/clients",
                                  params = self.client_params
                                )
    render json: @client.to_json
  end

  def remove_client
    @client = helpers.connect_api(action = 'del', url = self.set_clients_url)
    render "clients"
  end

  private
  def client_params
    {
      "name"=> request.params['name'],
      "mail"=> request.params['email'],
      "document"=> request.params['cpf'],
    }
  end

  def get_clients
    @clients = helpers.connect_api(action = 'get',
                                    url = "http://localhost:3000/api/v1/clients",
                                    params = [])
  end

  def set_clients_url
    "http://localhost:3000/api/v1/clients/#{request.params['id']}"
  end

end
