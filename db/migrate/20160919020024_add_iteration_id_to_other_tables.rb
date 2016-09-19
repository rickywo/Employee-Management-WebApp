class AddIterationIdToOtherTables < ActiveRecord::Migration[5.0]
  def change
    add_reference :employees, :iteration, index: true, foreign_key: true, :default => 1
    add_reference :teams, :iteration, index: true, foreign_key: true, :default => 1
    add_reference :projects, :iteration, index: true, foreign_key: true, :default => 1
    add_reference :team_members, :iteration, index: true, foreign_key: true, :default => 1
  end
end
