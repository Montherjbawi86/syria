class Booking < ApplicationRecord
  enum status: { pending: 0, confirmed: 1, canceled: 2, rejected: 3 }

  belongs_to :ride
  belongs_to :passenger, class_name: 'User'

  validates :seats, numericality: { only_integer: true, greater_than: 0 }
  validate :available_seats
  validate :passenger_cannot_be_driver

  private

  def available_seats
    if seats && ride && seats > ride.available_seats
      errors.add(:seats, "لا يوجد مقاعد كافية متاحة")
    end
  end

  def passenger_cannot_be_driver
    if passenger == ride.driver
      errors.add(:base, "لا يمكن للسائق حجز مقعد في رحلته الخاصة")
    end
  end
end
