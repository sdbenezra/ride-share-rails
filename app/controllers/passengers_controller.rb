class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.find_by(id: params[:id])
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def update
    passenger = Passenger.find_by(id: params[:id])

    if passenger.update(passenger_params)
      redirect_to passenger_path
    else
      render :edit
    end
  end

  private

  def passenger_params
    return
      params.require(:passenger).permit(:id, :name, :phone_num)
  end
end
