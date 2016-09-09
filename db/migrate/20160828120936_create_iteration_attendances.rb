class CreateIterationAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :iteration_attendances do |t|
      t.integer :iteration_id
      t.integer :employee_id
      t.integer :leave_days

      t.timestamps
    end
  end
end
