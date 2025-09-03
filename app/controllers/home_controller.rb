class HomeController < ApplicationController
  def index
    @rides = Ride.upcoming.available.order(created_at: :desc).limit(6)
  end

  def about
  end

  def contact
  end

  def how_it_works
  end
end
