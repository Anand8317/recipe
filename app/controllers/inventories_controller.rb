class InventoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @inventories = current_user.inventories
  end

  def show
    @inventory = current_user.inventories.find(params[:id])
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = current_user.inventories.build(inventory_params)
    if @inventory.save
      redirect_to @inventory, notice: 'Inventory was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @inventory = current_user.inventories.find(params[:id])
    @inventory.destroy
    redirect_to inventories_url, notice: 'Inventory was successfully deleted.'
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
