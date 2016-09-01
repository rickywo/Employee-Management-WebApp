class CreateProjectIterations < ActiveRecord::Migration[5.0]
  def change
    create_table :project_iterations do |t|
      t.integer :project_id
      t.integer :iteration_id

      t.timestamps
    end
  end
end
