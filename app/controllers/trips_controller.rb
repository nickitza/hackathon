class TripsController < ApplicationController
  before_action :set_trip, only:[:show, :edit, :update, :destroy]
  
  def index
    
    @trips = current_user.trips
  end

  def show
  end

  def new
    @trip = Trip.new
    render partial: 'form'
  end

  def create
    @trip = current_user.trips(trip_params)
    if @trip.save
      redirect_to trips_path
    else
      :new
    end
  end

  def edit
    render partial: 'form'
  end

  def update
    if @trip.update(trip_params)
      redirect_to trips_path
    else
      :new
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private
 def trip_params
   params.require(:trip).permit(:name)
 end

 def set_trip
   @trip = current_user.trips.find(params[:id])
 end

end

