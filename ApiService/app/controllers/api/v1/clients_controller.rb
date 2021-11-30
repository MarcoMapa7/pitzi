class Api::V1::ClientsController < Api::V1::ApiController
 before_action :set_client, only: [:show, :update, :destroy]

 # GET /api/v1/clients.json
 def index
   @clients = Client.all
   render json: @clients
 end

 # GET /api/v1/clients/1.json
 def show
   render json: @client
 end

 # POST /api/v1/clients.json
 def create
   @client = Client.new(client_params)
   if @client.save
     render json: @client, status: :created
   else
     render json: @client.errors, status: :unprocessable_entity
   end
 end

 # PATCH/PUT /api/v1/clients/1.json
 def update
   if @client.update(client_params)
     render json: @client
   else
     render json: @client.errors, status: :unprocessable_entity
   end
 end

 # DELETE /api/v1/clients/1.json
 def destroy
   @client.destroy
 end

 private
   # Use callbacks to share common setup or constraints between actions.

   def set_client
     @client = Client.find(params[:id])
   end

   # Only allow a trusted parameter "white list" through.
   def client_params
     params.permit(:name, :mail,:document)
   end

end
