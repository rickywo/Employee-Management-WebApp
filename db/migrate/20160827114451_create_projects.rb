class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :status
      t.boolean :is_capitalizable
      t.integer :weight
      t.datetime :release_date
      t.text :description
      t.integer :team_id

      t.timestamps
    end
  end
end
