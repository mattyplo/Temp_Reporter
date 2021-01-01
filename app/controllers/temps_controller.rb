class TempsController < ApplicationController
  def index
    #  get the oldest date on record
    @min_date = SensorReading.order("date_time").limit(1)[0].date_time
    @max_date = DateTime.now
    # byebug
    # byebug
    @latest_reading = SensorReading.last
    @readings = SensorReading.paginate(page: params[:page], per_page: 30).order('date_time DESC')
  end
end
