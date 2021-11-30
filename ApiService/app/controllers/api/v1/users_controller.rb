class Api::V1::UsersController < Api::V1::ApiController
 before_action :set_user, only: [:show, :update, :destroy]

 # GET /api/v1/users.json
 def index
   @users = User.all
   render json: @users
 end

 # GET /api/v1/users/1.json
 def show
   render json: @user
 end

 # POST /api/v1/clients.json
 def create
   @user = User.new(user_params)
   if @user.save
     render json: @user, status: :created
   else
     render json: @user.errors, status: :unprocessable_entity
   end
 end

 # PATCH/PUT /api/v1/users/1.json
 def update
   if @user.update(user_params)
     render json: @user
   else
     render json: @user.errors, status: :unprocessable_entity
   end
 end

 # DELETE /api/v1/users/1.json
 def destroy
   @user.destroy
 end

 private
   # Use callbacks to share common setup or constraints between actions.

   def set_user
     @user = User.find(params[:id])
   end

   # Only allow a trusted parameter "white list" through.
   def user_params
     params.permit(:name, :email,:password)
   end

end
