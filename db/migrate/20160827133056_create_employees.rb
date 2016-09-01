class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :title
      t.boolean :status
      t.integer :employment_type
      t.float :hourly_rate
      t.integer :location
      t.integer :capitalizable_group_id
      t.datetime :commencement_date
      t.datetime :termination_date

      t.timestamps
    end
  end
end
