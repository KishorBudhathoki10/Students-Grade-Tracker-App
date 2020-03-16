class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string     :name
      t.integer    :age
      t.text       :family_history
      t.text       :strengths
      t.text       :weaknesses
      t.string     :disabilities
      t.text       :profile_image
      t.integer    :section_id
      t.belongs_to :section, foreign_key: true

      t.timestamps
    end
  end
end
