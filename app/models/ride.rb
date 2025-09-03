class Ride < ApplicationRecord
  belongs_to :driver, class_name: 'User'
  has_many :bookings, dependent: :destroy

  validates :from_city, :to_city, :departure_time, presence: true
  validates :available_seats, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }

  scope :upcoming, -> { where('departure_time > ?', Time.now) }
  scope :available, -> { where('available_seats > 0') }
end
