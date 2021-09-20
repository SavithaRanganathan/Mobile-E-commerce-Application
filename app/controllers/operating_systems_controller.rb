class OperatingSystemsController < ApplicationController
   before_action :set_operating_system, only: [:show, :edit, :update, :destroy]
  def index
    @operating_system = OperatingSystem.all
  end

  def new
     @operating_system = OperatingSystem.new
  end

  def create
    @operating_system = OperatingSystem.new(operating_system_params)

    respond_to do |format|
      if @operating_system.save
        format.html { redirect_to @operating_system, notice: 'operating_system was successfully created.' }
        format.json { render :show, status: :created, location: @operating_system }
      else
        format.html { render :new }
        format.json { render json: @operating_system.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
     @operating_system = OperatingSystem.find(params[:id])
  end

  def update
    respond_to do |format|
      if @operating_system.update(operating_system_params)
        format.html { redirect_to @operating_system, notice: 'operating_system was successfully updated.' }
        format.json { render :show, status: :ok, location: @operating_system }
      else
        format.html { render :edit }
        format.json { render json: @operating_system.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @operating_system.destroy
    respond_to do |format|
      format.html { redirect_to operating_systems_url, notice: 'Operating system was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_operating_system
    @operating_system = OperatingSystem.find(params[:id])
  end

  def operating_system_params
      params.require(:operating_system).permit(:name, :company, :version)
    end
end
