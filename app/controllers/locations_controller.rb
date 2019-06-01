class LocationsController < ApplicationController
  before_action :set_trip
  before_action :set_location, only:[:show, :edit, :update, :destroy]
  
  def index
    @locations = @trip.locations
  end

  def show
  end

  def new
    @location = @trip.locations.new()
    @location.build_address
  end

  def create
    add_atts = params[:location][:address_attributes]
    @location = @trip.locations.new(location_params)
    if @location.save
      a = @location.create_address(street: add_atts[:street], city: add_atts[:city], state: add_atts[:state], zip: add_atts[:zip])
      # binding.pry
      redirect_to trip_locations_path(@trip)
    else
      render :new
    end
  end

  def edit
    @location.build_address if @location.address.nil?
  end

  def update
    if @location.update(location_params)
      redirect_to trip_locations_path(@trip)
    else 
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to trip_locations_path(@trip)
  end

  private
  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :days)
  end
  


end
