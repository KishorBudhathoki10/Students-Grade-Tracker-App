class CreateListeningEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :listening_enrollments do |t|
      t.integer :marks, default: 0
      t.belongs_to :student, foreign_key: true
      t.belongs_to :listening, foreign_key: true

      t.timestamps
    end
  end
end
