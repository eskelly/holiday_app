class AbsenceType < ActiveRecord::Base
	# attr_accessible :name

  has_many :absences
end
