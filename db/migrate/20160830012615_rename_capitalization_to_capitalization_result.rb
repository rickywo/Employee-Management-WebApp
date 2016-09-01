class RenameCapitalizationToCapitalizationResult < ActiveRecord::Migration[5.0]
  def change
    rename_table :capitalizations, :capitalization_results
  end
end
