class YearsController < ApplicationController
  MIN_YEAR = 1852

  def index
    today = Date.today
    years = (MIN_YEAR...today.year).select do |year|
      date = Date.new year, today.mon, today.mday
      date.wday == today.wday
    end
    years << today.year
    render json: years
  end
end