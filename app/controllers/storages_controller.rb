class StoragesController < ApplicationController
   before_action :set_storage, only: [:show, :edit, :update, :destroy]
  def index
    @storage = Storage.all
  end

  def new
     @storage = Storage.new
  end

  def create
    @storage = Storage.new(storage_params)

    respond_to do |format|
      if @storage.save
        format.html { redirect_to @storage, notice: 'Storage was successfully created.' }
        format.json { render :show, status: :created, location: @storage }
      else
        format.html { render :new }
        format.json { render json: @storage.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
     @storage = Storage.find(params[:id])
  end

  def update
    respond_to do |format|
      if @storage.update(storage_params)
        format.html { redirect_to @storage, notice: 'storage was successfully updated.' }
        format.json { render :show, status: :ok, location: @storage }
      else
        format.html { render :edit }
        format.json { render json: @storage.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @storage.destroy
    respond_to do |format|
      format.html { redirect_to storage_url, notice: 'storage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_storage
    @storage = Storage.find(params[:id])
  end

  def storage_params
      params.require(:storage).permit(:primary, :secondary, :extended, :memory_card)
  end
end
