class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :title
      t.boolean :status
      # 1: Permanent 2: Contract
      t.integer :employment_type
      # attendance_rate: the percentage of a week an employee worked (E.g. 3 or 4 days a week.)
      t.integer :attendance_rate,  default:100
      t.float :hourly_rate
      # 1: AU 2: LA
      t.integer :location
      t.integer :capitalizable_group_id
      t.datetime :commencement_date
      t.datetime :termination_date

      t.timestamps
    end
  end
end
