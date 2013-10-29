module AbsencesHelper

  def create_absence_row(absence)
    content_tag_for :tr, absence do
      content_tag(:td, absence.absence_type.name) +
        content_tag(:td, show_date_with_details(absence)) +
        content_tag(:td, show_date_with_details(absence, false)) +
        content_tag(:td, absence.description) +
        content_tag(:td, absence.working_days_used) +
        content_tag(:td, holiday_status(absence)) +
        content_tag(:td, :class => "actions") do
        link_to('Delete', absence_path(absence), :method => :delete, :data => {:confirm => 'Are you sure you want to delete this request?'}, :remote => true)
          end
    end
  end


  def users_off_on_given_day(managerid, date)
    array = []
    User.get_team_users(managerid).each do |user|
      unless @current_user.id == user.id
        user.absences.each do |ab|
          array << user if (ab.date_from..ab.date_to).cover?(date)
        end
      end
    end
    array
  end


  def holiday_status(absence)
    status = absence.holiday_status.status
    content_tag :span, status, :class => holiday_status_class(absence)
  end

  def holiday_status_class(absence)
    "label #{absence.holiday_status.status.downcase}"
  end

  private

  def day_to_show
    day_show = ""
    if @week==1 then
      if @day>@start_day-1 then
        day_show = (@day-@start_day+1).to_s
      end
    else
      if @day_adjusted-@start_day+1<@days_in_month+@start_day
        day_show =(@day-@start_day+1).to_s
      end
    end
    day_show
  end

  def days_in_month date_to_check
    days_in_month = (((date_to_check+1.month).at_beginning_of_month)-1.day).mday
    days_in_month
  end


  def show_date_with_details hol, is_date_from = true
    date_from = hol.date_from
    date_to = hol.date_to

    if is_date_from
      if date_from.hour == 13
        date_from.strftime("%d/%m/%Y") + " - Afternoon"
      else
        date_from.strftime("%d/%m/%Y")
      end
    else
      if date_to.hour == 12
        date_to.strftime("%d/%m/%Y") + " - Morning"
      else
        date_to.strftime("%d/%m/%Y")
      end
    end

  end

end
