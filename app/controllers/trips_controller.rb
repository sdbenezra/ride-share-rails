class TripsController < ApplicationController

  def index
    @trips = Trips.all
  end

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def update
    trip = Trip.find_by(id: params[:id])

    if trip.update(trip_params)
      redirect_to trip_path
    else
      render :edit
    end
  end

  private

  def trip_params
    return
      params.require(:trip).permit(:id, :date, :rating, :cost, :driver_id, :passenger_id)
  end
end
