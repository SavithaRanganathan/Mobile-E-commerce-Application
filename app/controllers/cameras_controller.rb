class CamerasController < ApplicationController
  before_action :set_camera, only: [:show, :edit, :update, :destroy]

  def index
    @camera = Camera.all
  end

  def new
    @camera = Camera.new
  end

  def create
    @camera = Camera.new(camera_params)

    respond_to do |format|
      if @camera.save
        format.html { redirect_to @camera, notice: 'camera was successfully created.' }
        format.json { render :show, status: :created, location: @camera }
      else
        format.html { render :new }
        format.json { render json: @camera.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @camera = Camera.find(params[:id])
  end

  def update
    respond_to do |format|
      if @camera.update(camera_params)
        format.html { redirect_to @camera, notice: 'camera was successfully updated.' }
        format.json { render :show, status: :ok, location: @camera }
      else
        format.html { render :edit }
        format.json { render json: @camera.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @camera.destroy
    respond_to do |format|
      format.html { redirect_to camera_url, notice: 'Camera was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_camera
    @camera = Camera.find(params[:id])
  end

  def camera_params
      params.require(:camera).permit(:type, :postion, :pixel,:model_id)
    end
end
