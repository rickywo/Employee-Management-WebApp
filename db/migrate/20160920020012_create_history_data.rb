class CreateHistoryData < ActiveRecord::Migration[5.0]
  def change
    create_table :history_data do |t|
      t.text :iteration_data
      t.text :result_data

      t.timestamps
    end
  end
end
