class AddressesController < ApplicationController
  before_action :set_address, :set_location, :set_location_address

  def index

  end

  def show
  end

  def edit
    render :edit
  end

  def update
    if @address.update(address_params)
      redirect_to location_addresses_path(@location)
    else
      render :edit
    end
  end

  def new
    @address = @location.create_address()
    render :new
  end

  def create
    @address = @location.create_address(params[:address])
    if @address.save
      redirect_to location_addresses_path(@location)
    else
      render :new
    end
  end

  def destroy
    @address.destroy
    redirect_to location_addresses_path(@location)
  end

  private
  def set_location
    @location = Location.find(params[:location_id])
  end

  def set_address
    @address = Address.create(params[:address])
  end

  def set_location_address
    @location.address = @address
  end

  def address_params
    params.require(:address).permit(:name, :street, :city, :state, :zip)
  end

end
