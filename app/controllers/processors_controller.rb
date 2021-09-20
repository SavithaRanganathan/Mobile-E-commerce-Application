class ProcessorsController < ApplicationController
   before_action :set_processor, only: [:show, :edit, :update, :destroy]
  def index
    @processor = Processor.all
  end

  def new
     @processor = Processor.new
  end

  def create
    @processor = Processor.new(processor_params)

    respond_to do |format|
      if @processor.save
        format.html { redirect_to @processor, notice: 'processor was successfully created.' }
        format.json { render :show, status: :created, location: @processor }
      else
        format.html { render :new }
        format.json { render json: @processor.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
     @processor = Processor.find(params[:id])
  end

  def update
    respond_to do |format|
      if @processor.update(processor_params)
        format.html { redirect_to @processor, notice: 'processor was successfully updated.' }
        format.json { render :show, status: :ok, location: @processor }
      else
        format.html { render :edit }
        format.json { render json: @processor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
     @processor.destroy
    respond_to do |format|
      format.html { redirect_to processors_url , notice: 'processor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_processor
    @processor = Processor.find(params[:id])
  end

  def processor_params
      params.require(:processor).permit(:name, :company, :speed)
  end
end
