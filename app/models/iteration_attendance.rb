class IterationAttendance < ApplicationRecord
  belongs_to :iteration
  belongs_to :employee
end
