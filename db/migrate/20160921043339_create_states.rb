class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states, id: false do |t|
      t.string :state
      t.integer :value
      t.index :state, unique: true
    end
  end
end
