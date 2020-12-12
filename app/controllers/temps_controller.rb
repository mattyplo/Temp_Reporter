class TempsController < ApplicationController
  def index
    @latest_reading = SensorReading.last

    @readings = SensorReading.paginate(page: params[:page], per_page: 30).order('date_time DESC')
  end
end
