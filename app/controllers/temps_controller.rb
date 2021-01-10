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
      @min_temp = @readings.last(240).min_by(&:temp).temp - 0.1
      @max_temp = @readings.last(240).max_by(&:temp).temp + 0.1
      # byebug
      # @graph_readings = SensorReading.where(:date_time => @date_selected.to_date.beginning_of_day..@date_selected.to_date.end_of_day).paginate(page: params[:page], per_page: 96).order('date_time DESC')
    else
      @readings = SensorReading.paginate(page: params[:page], per_page: 30).order('date_time DESC')
      @min_temp = SensorReading.last(240).min_by(&:temp).temp - 0.1
      @max_temp = SensorReading.last(240).max_by(&:temp).temp + 0.1
      # graph_readings = SensorReading.where(:date_time => @date_selected.to_date.beginning_of_day..@date_selected.to_date.end_of_day).paginate(page: params[:page], per_page: 96).order('date_time DESC')
      # @graph_readings = SensorReading.all
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
