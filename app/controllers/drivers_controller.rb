class DriversController < ApplicationController

  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find_by(id: params[:id])
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def update
    driver = Driver.find_by(id: params[:id])

    if driver.update(driver_params)
      redirect_to driver_path
    else
      render :edit
    end
  end

  private

  def driver_params
    return
      params.require(:driver).permit(:id, :name, :vin)
  end
end
