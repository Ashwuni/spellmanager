class CreateSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|
      t.string :name, limit: 100, null: false
      t.references :book, foreign_key: true
#       level
#       school
#       classes
#       concentration
      t.string :description, limit: 4096

      t.timestamps
    end
  end
end
