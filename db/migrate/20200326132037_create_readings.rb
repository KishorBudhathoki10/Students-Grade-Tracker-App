class CreateReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :readings do |t|
      t.text :title
      t.belongs_to :grade, foreign_key: true

      t.timestamps
    end
  end
end
