class RenameTeammemberToTeamMember < ActiveRecord::Migration[5.0]
  def change
    rename_table :teammembers, :team_members
  end
end
