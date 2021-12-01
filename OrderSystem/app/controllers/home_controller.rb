class HomeController < ApplicationController
  helper ApiHelper
  skip_before_action :verify_authenticity_token
  before_action :get_clients, only:[:clients, :remove_client]
  before_action :get_orders, only:[:orders, :remove_order]

  def index
  end

  def clients
  end

  def orders
  end

  def client_new
  end

  def order_new
    self.get_clients
  end

  def client_edit
    @client = helpers.connect_api(action = 'get', url = self.set_clients_url)
  end

  def order_edit
    @order = helpers.connect_api(action = 'get', url = self.set_orders_url)
    self.get_clients
  end

  def send_client_edit
    @client = helpers.connect_api(action = 'put',
                                  url = self.set_clients_url,
                                  params = self.client_params
                                  )
    render json: @client.to_json
  end

  def send_order_edit
    @order = helpers.connect_api(action = 'put',
                                  url = self.set_orders_url,
                                  params = self.order_params
                                  )
    render json: @order.to_json
  end

  def send_client_new
    @client = helpers.connect_api(action = 'post',
                                  url = self.set_clients_url,
                                  params = self.client_params
                                )
    render json: @client.to_json
  end

  def send_order_new
    @order = helpers.connect_api(action = 'post',
                                  url = self.set_orders_url,
                                  params = self.order_params
                                )
    render json: @order.to_json
  end

  def remove_client
    @client = helpers.connect_api(action = 'del', url = self.set_clients_url)
    render "clients"
  end

  def remove_order
    @order = helpers.connect_api(action = 'del', url = self.set_orders_url)
    render "orders"
  end

  private
  def client_params
    {
      "name"=> request.params['name'],
      "mail"=> request.params['email'],
      "document"=> request.params['cpf'],
    }
  end

  def order_params
    {
      "user_id"=> request.params['user_id'],
      "device_model"=> request.params['device_model'],
      "IMEI_device"=> request.params['IMEI_device'],
      "annual_value"=> request.params['annual_value'],
      "qty_installments"=> request.params['qty_installments'],
    }
  end

  def get_clients
    @clients = helpers.connect_api(action = 'get',
                                    url = 'http://localhost:3000/api/v1/clients',
                                    params = [])
  end

  def get_orders
    @orders = helpers.connect_api(action = 'get',
                                    url = 'http://localhost:3000/api/v1/orders',
                                    params = [])
  end

  def set_clients_url
    "http://localhost:3000/api/v1/clients/#{request.params['id']}"
  end

  def set_orders_url
    "http://localhost:3000/api/v1/orders/#{request.params['id']}"
  end

end
