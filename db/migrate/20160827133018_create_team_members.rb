class CreateTeammembers < ActiveRecord::Migration[5.0]
  def change
    create_table :team_members do |t|
      t.integer :team_id
      t.integer :employee_id
      t.integer :dedication_weight

      t.timestamps
    end
  end
end
