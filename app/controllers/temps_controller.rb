class TempsController < ApplicationController
  def index
    #  get the oldest date on record
    # byebug
    @min_date = SensorReading.order("date_time").limit(1)[0].date_time
    @max_date = DateTime.now
    # byebug
    @date_selected = params[:date_selected]
    @latest_reading = SensorReading.last
    if @date_selected != nil
      @readings = SensorReading.where(:date_time => @date_selected.to_date.beginning_of_day..@date_selected.to_date.end_of_day).paginate(page: params[:page], per_page: 96).order('date_time DESC')
      # byebug
    else
      @readings = SensorReading.paginate(page: params[:page], per_page: 30).order('date_time DESC')
    end
    # byebug
  end
#  def specific_date 
#     #  get the oldest date on record
#     byebug
#     @min_date = SensorReading.order("date_time").limit(1)[0].date_time
#     @max_date = DateTime.now
    
#     @date_selected = params[:date_selected]
#     @latest_reading = SensorReading.last
#     if @date_selected != nil
#       @readings = SensorReading.where(:date_time => @date_selected.to_date.beginning_of_day..@date_selected.to_date.end_of_day).paginate(page: params[:page], per_page: 96).order('date_time DESC')
#       # byebug
#     else
#       @readings = SensorReading.paginate(page: params[:page], per_page: 30).order('date_time DESC')
#     end
#     byebug
#   end
end
