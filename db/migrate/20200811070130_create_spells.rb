class CreateSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|
      t.string :name, limit: 70, null:false
      t.integer :level
      t.string :school
      t.string :concentration
      t.string :classes
      t.string :description, limit: 4096, null:false

      t.timestamps
    end
  end
end
