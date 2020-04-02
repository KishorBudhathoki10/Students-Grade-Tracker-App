class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.string :name
      t.text :thumb_image

      t.timestamps
    end
  end
end
