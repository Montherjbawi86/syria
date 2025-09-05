class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def dashboard
    @users_count = User.count
    @rides_count = Ride.count
    @bookings_count = Booking.count
    @drivers_count = User.driver.count

    @recent_users = User.order(created_at: :desc).limit(5)
    @recent_rides = Ride.includes(:driver).order(created_at: :desc).limit(5)
    @recent_bookings = Booking.includes(:ride, :passenger).order(created_at: :desc).limit(5)
  end
def show_user
  @user = User.find(params[:id])
end

def rides
  @rides = Ride.includes(:driver, :bookings).order(created_at: :desc)
  @cities = Ride.pluck(:from_city, :to_city).flatten.uniq.compact.sort
end

def destroy_ride
  @ride = Ride.find(params[:id])
  @ride.destroy
  redirect_to admin_rides_path, notice: 'تم حذف الرحلة بنجاح'

end

  def users
    @users = if params[:role]
               User.where(role: params[:role])
             else
               User.all
             end.order(created_at: :desc)
  end

  def destroy_user
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'تم حذف المستخدم بنجاح'
  end

  def bookings
    @bookings = if params[:status]
                  Booking.where(status: params[:status])
                else
                  Booking.all
                end.includes(:ride, :passenger).order(created_at: :desc)
  end
def update_booking
  @booking = Booking.find(params[:id])
  if @booking.update(booking_params)
    redirect_to admin_bookings_path, notice: 'تم تحديث حالة الحجز بنجاح'
  else
    redirect_to admin_bookings_path, alert: 'حدث خطأ أثناء التحديث'
  end
end
  private

  def require_admin
    unless current_user&.admin?
      redirect_to root_path, alert: 'غير مصرح لك بالوصول إلى هذه الصفحة'
    end
  end
end
