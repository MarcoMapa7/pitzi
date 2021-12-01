class SettingApisController < ApplicationController
  before_action :set_setting_api, only: %i[ show edit update destroy ]

  # GET /setting_apis or /setting_apis.json
  def index
    @setting_apis = SettingApi.all
  end

  # GET /setting_apis/1 or /setting_apis/1.json
  def show
  end

  # GET /setting_apis/new
  def new
    @setting_api = SettingApi.new
  end

  # GET /setting_apis/1/edit
  def edit
  end

  # POST /setting_apis or /setting_apis.json
  def create
    @setting_api = SettingApi.new(setting_api_params)

    respond_to do |format|
      if @setting_api.save
        format.html { redirect_to @setting_api, notice: "Setting api was successfully created." }
        format.json { render :show, status: :created, location: @setting_api }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @setting_api.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /setting_apis/1 or /setting_apis/1.json
  def update
    respond_to do |format|
      if @setting_api.update(setting_api_params)
        format.html { redirect_to @setting_api, notice: "Setting api was successfully updated." }
        format.json { render :show, status: :ok, location: @setting_api }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @setting_api.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setting_apis/1 or /setting_apis/1.json
  def destroy
    @setting_api.destroy
    respond_to do |format|
      format.html { redirect_to setting_apis_url, notice: "Setting api was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting_api
      @setting_api = SettingApi.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def setting_api_params
      params.require(:setting_api).permit(:email_access, :token_access)
    end
end
