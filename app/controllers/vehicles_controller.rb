class VehiclesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  def index
    vehicles = Vehicle.all
    render json: vehicles, status: 200
  end

  def show
    vehicle = Vehicle.find_by(id: params[:id])
    if vehicle
      render json: vehicle, status: 200
    else
      render json: { message: "Vehicle not found", errors: vehicle.errors}
    end
  end

  def create
    vehicle = Vehicle.new(vehicle_params)
    if vehicle.save
      render json: { message: "Vehicle created successfully!" }, status: 200
    else
      render json: { error: "There was a problem creating vehicle!", errors: vehicle.errors }
    end
  end

  def update
    vehicle = Vehicle.find_by(id: params[:id])
    if vehicle.update(vehicle_params)
      render json: { message: "Vehicle updated successfully!" }, status: 200
    else
      render json: { message: "There was a problem updating vehicle!", errors: vehicle.errors }
    end
  end

  def destroy
    vehicle = Vehicle.find_by(id: params[:id])
    if vehicle.destroy
      render json: { message: "Vehicle deleted successfully!" }, status: 200
    else
      render json: { error: "There was a problem deleting vehicle!", errors: vehicle.errors }
    end
  end

  def vehicle_params
    params.require(:vehicle).permit(:plate_number, :vehicle_type, :make, :production_year, :user_id)
  end

end
