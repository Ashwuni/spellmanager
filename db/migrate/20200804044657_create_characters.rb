class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :class, limit: 35, null: false
      t.timestamps
    end
  end
end
