class CreateIterations < ActiveRecord::Migration[5.0]
  def change
    create_table :iterations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :work_day

      t.timestamps
    end
  end
end
