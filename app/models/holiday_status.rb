class HolidayStatus < ActiveRecord::Base
  # attr_accessible :status

  has_one :absence

  scope :pending_only, where('status = "Pending"')

  scope :user_statuses, lambda { |user_type_name|
     if user_type_name == "Manager"
       all
     else
       where('status == "Pending" and status == "Cancelled"')
     end
     }

  def self.conditions_mgr
    conditions=[]
    conditions << self.status !="Pending" and self.status != "Cancelled"
  end
end
