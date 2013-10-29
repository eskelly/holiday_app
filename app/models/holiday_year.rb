class HolidayYear < ActiveRecord::Base

  # attr_accessible :description, :date_start, :date_end

  ## Associations
  has_many :absences
  has_many :user_days_for_years

  ## Scopes
  scope :holiday_years_containing_holiday, lambda { |date_start, date_end| where('(? between date_start and date_end) or (? between date_start and date_end)', date_start, date_end) }
  scope :holiday_year_used, lambda { |date_start, date_end| where('date_start <= ? and date_end >= ?', date_start, date_end) }

  def self.current_year
    today = Date.today
    self.where('date_start <= ? and date_end >= ?', today, today).first
  end

end
