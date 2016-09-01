class CreateIterationAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :iteration_attendances do |t|
      t.integer :iteration_id
      t.integer :employee_id
      t.integer :attendance_rate

      t.timestamps
    end
  end
end
