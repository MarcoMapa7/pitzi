class Api::V1::OrdersController < Api::V1::ApiController
 before_action :set_order, only: [:show, :update, :destroy]

 # GET /api/v1/orders.json
 def index
   @orders = Order.all
   render json: @orders
 end

 # GET /api/v1/orders/1.json
 def show
   render json: {'order':@order, 'client':Client.find(@order.user_id)}
 end

 # POST /api/v1/orders.json
 def create
   @order = Order.new(order_params)
   if @order.save
     render json: @order, status: :created
   else
     render json: @order.errors, status: :unprocessable_entity
   end
 end

 # PATCH/PUT /api/v1/orders/1.json
 def update
   if @order.update(order_params)
     render json: @order
   else
     render json: @order.errors, status: :unprocessable_entity
   end
 end

 # DELETE /api/v1/orders/1.json
 def destroy
   @order.destroy
 end

 private
   # Use callbacks to share common setup or constraints between actions.

   def set_order
     @order = Order.find(params[:id])
   end

   # Only allow a trusted parameter "white list" through.
   def order_params
     params.permit(:user_id, :device_model, :IMEI_device, :annual_value, :qty_installments)
   end

end
