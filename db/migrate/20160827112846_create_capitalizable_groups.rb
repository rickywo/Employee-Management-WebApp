class CreateCapitalizableGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :capitalizable_groups do |t|
      t.float :capitalizable_rate
      t.text :description

      t.timestamps
    end
  end
end
