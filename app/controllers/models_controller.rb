class ModelsController < ApplicationController
    before_action :set_model_params, only: [:show, :edit, :update, :destroy]

  def index
    @model = Model.all
  end

  def new
    @model = Model.new
   
  end

  def create
    save_details(params)
    
    @model = Model.new(model_params)
    
    respond_to do |format|
      if @model.save
        @camera = Camera.create({"type"=>params[:model][:camera][:type],"postion"=>params[:model][:camera][:postion],"pixel"=>params[:model][:camera][:pixel],"model_id"=>@model.id}) if params[:model][:camera].present?
        format.html { redirect_to @model, notice: 'Model was successfully created.' }
        format.json { render :show, status: :created, location: @model }
      else
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @model = Model.find(params[:id])
  end


  def update
    save_details(params)
    respond_to do |format|
      if params[:model][:camera].present?
        @model.cameras.destroy
        @camera = Camera.create({"type"=>params[:model][:camera][:type],"postion"=>params[:model][:camera][:postion],"pixel"=>params[:model][:camera][:pixel],"model_id"=>@model.id})
      end
      if @model.update(model_params)
        format.html { redirect_to @model, notice: 'Model was successfully updated.' }
        format.json { render :show, status: :ok, location: @manufacturer }
      else
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @model.cameras.destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to models_url, notice: 'Model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def save_details(params)
    @manufacturer = Manufacturer.create({"name"=>params[:model][:manufacturers][:name], "year_of_establishment"=>params[:model][:manufacturers][:year_of_establishment], "parent_company"=>params[:model][:manufacturers][:parent_company]}) if params[:model][:manufacturers][:name].present?
    params[:model][:manufacturer_id] = @manufacturer.id if params[:model][:manufacturers][:name].present?
    
    @storage = Storage.create({"primary"=>params[:model][:storage][:primary],"secondary"=>params[:model][:storage][:secondary],"extended"=>params[:model][:storage][:extended],"memory_card"=>params[:model][:storage][:memory_card]}) if params[:model][:storage][:primary].present?
    params[:model][:storage_id] = @storage.id if params[:model][:storage][:primary].present?
   
    @operating_system = OperatingSystem.create({"name"=>params[:model][:operating_system][:name],"company"=>params[:model][:operating_system][:company],"version"=>params[:model][:operating_system][:version]}) if params[:model][:operating_system][:name].present?
    params[:model][:operating_system_id] = @operating_system.id if params[:model][:operating_system][:name].present?

    @processor = Processor.create({"name"=>params[:model][:processor][:name],"company"=>params[:model][:processor][:company],"speed"=>params[:model][:processor][:speed]}) if params[:model][:processor][:name].present?
    params[:model][:processor_id] = @processor.id if params[:model][:processor][:name].present?   
  end

  def model_params
        params.require(:model).permit(:name, :description, :selling_price,:year_of_release,:usb_type, :battery_capacity, :height, :width, :sim_type, :colour, :network_supported,:manufacturer_id,:storage_id,:processor_id,:operating_system_id,
          manufactures_attributes: [:name,:year_of_establishment,:parent_company],
          storages_attributes: [:primary,:secondary,:extended,:memory_card],
          operating_systems_attributes: [:name,:version,:company],
          processors_attributes: [:name,:company,:speed],
          cameras_attributes: [:type,:postion,:pixel])
       
  
  end

  def set_model_params

    @model = Model.find(params[:id])
    
  end
end
