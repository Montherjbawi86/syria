class RidesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ride, only: [:show, :edit, :update, :destroy]
  before_action :authorize_ride_owner, only: [:edit, :update, :destroy]
  before_action :ensure_driver, only: [:new, :create]

  def index
    @rides = Ride.upcoming.available.order(departure_time: :asc)
  end

  def show
  end

  def new
    @ride = current_user.rides.build
  end

  def create
    @ride = current_user.rides.build(ride_params)

    if @ride.save
      redirect_to @ride, notice: 'تم إنشاء الرحلة بنجاح.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ride.update(ride_params)
      redirect_to @ride, notice: 'تم تحديث الرحلة بنجاح.'
    else
      render :edit
    end
  end

  def destroy
    @ride.destroy
    redirect_to rides_url, notice: 'تم حذف الرحلة بنجاح.'
  end

  private

  def set_ride
    @ride = Ride.find(params[:id])
  end

  def ride_params
    params.require(:ride).permit(:from_city, :to_city, :departure_time, :available_seats, :price, :notes)
  end

  def authorize_ride_owner
    redirect_to rides_path, alert: 'غير مصرح لك بتنفيذ هذه العملية.' unless @ride.driver == current_user
  end

  def ensure_driver
    redirect_to rides_path, alert: 'يجب أن تكون سائقاً لإنشاء رحلة.' unless current_user.driver?
  end
end
