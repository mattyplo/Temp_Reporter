class TempsController < ApplicationController

  require 'net/http'

  def index

    seatacStationURI = URI('https://api.weather.gov/stations/KSEA/observations/latest')
    seatacData = Net::HTTP.get(seatacStationURI)
    seatacJSON = ActiveSupport::JSON.decode(seatacData)
    @seatacTemp = seatacJSON['properties']['temperature']['value']
    @min_date = SensorReading.order("date_time").limit(1)[0].date_time
    @max_date = DateTime.now
    # byebug
    @date_selected = params[:date_selected]
    @latest_reading = SensorReading.last
    if @date_selected != nil
      @readings = SensorReading.where(:date_time => @date_selected.to_date.beginning_of_day..@date_selected.to_date.end_of_day).paginate(page: params[:page], per_page: 96).order('date_time DESC')
      @min_temp = @readings.last(240).min_by(&:temp).temp - 0.1
      @max_temp = @readings.last(240).max_by(&:temp).temp + 0.1
      # byebug

    else
      @readings = SensorReading.paginate(page: params[:page], per_page: 30).order('date_time DESC')
      @min_temp = SensorReading.last(240).min_by(&:temp).temp - 0.1
      @max_temp = SensorReading.last(240).max_by(&:temp).temp + 0.1
    end
    # byebug
  end
end
