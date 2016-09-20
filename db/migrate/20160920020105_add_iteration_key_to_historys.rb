class AddIterationKeyToHistorys < ActiveRecord::Migration[5.0]
  def change
    add_reference :history_data, :iteration, index: true, foreign_key: true
  end
end
