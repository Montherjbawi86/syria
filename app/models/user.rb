class User < ApplicationRecord

  enum role: { passenger: 0, driver: 1, admin: 2 }, _default: :passenger

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rides, foreign_key: 'driver_id', dependent: :destroy
  has_many :bookings, foreign_key: 'passenger_id', dependent: :destroy

  validates :name, presence: true
  validates :phone, presence: true
  validates :role, presence: true
    def admin?
    role == 'admin' || admin == true
  end
end
