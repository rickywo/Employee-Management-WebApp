class CreateCapitalizations < ActiveRecord::Migration[5.0]
  def change
    create_table :capitalizations do |t|
      t.string :project_name
      t.string :employee_name
      t.datetime :date
      t.float :hours
      t.string :full_project_name
      t.string :hourly_rate
      t.integer :iteration_id

      t.timestamps
    end
  end
end
