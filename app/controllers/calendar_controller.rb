class CalendarController < ApplicationController

  before_filter :authenticate_user!

  def index
    #Populate the calendar
    respond_to do |format|
      format.js {
        holidays_json = Absence.team_holidays_as_json current_user, params[:start], params[:end], params[:filter]
        render :json => holidays_json
      }
    end
  end

  def show
    @holiday_status = HolidayStatus.order(:status)
  end
end