class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :grade_id
      t.belongs_to :grade, foreign_key: true

      t.timestamps
    end
  end
end
