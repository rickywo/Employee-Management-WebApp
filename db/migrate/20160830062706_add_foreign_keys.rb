class AddForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :projects, :teams
    add_foreign_key :team_members, :employees
    add_foreign_key :team_members, :teams
    add_foreign_key :capitalization_results, :iterations
    add_foreign_key :employees, :capitalizable_groups
  end
end
