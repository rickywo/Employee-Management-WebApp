class CreateCapitalizations < ActiveRecord::Migration[5.0]
  def change
    create_table :capitalizations do |t|
      t.integer :team_id
      t.integer :employee_id
      t.integer :iteration_id
      t.timestamps
    end
  end
end
