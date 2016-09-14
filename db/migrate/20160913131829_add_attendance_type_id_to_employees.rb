class AddAttendanceTypeIdToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_reference :employees, :attendance_type, index: true, foreign_key: true
  end
end
