class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :class
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
