class TempsController < ApplicationController
  def index
    @months = Date::MONTHNAMES.select { |month| !month.nil?}
    #  Get the first year records started.  
    @years = SensorReading.select("date_time").map{ |i| i.date_time.year }.uniq
    month = params[:month_selected]
    # byebug
    @latest_reading = SensorReading.last
    @readings = SensorReading.paginate(page: params[:page], per_page: 30).order('date_time DESC')
  end
end
