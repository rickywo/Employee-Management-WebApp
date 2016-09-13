class AddEmploymentTypeIdToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_reference :employees, :employment_type, index: true, foreign_key: true
  end
end
