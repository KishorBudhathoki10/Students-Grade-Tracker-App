class CreateSpeakings < ActiveRecord::Migration[5.0]
  def change
    create_table :speakings do |t|
      t.string :title
      t.belongs_to :grade, foreign_key: true

      t.timestamps
    end
  end
end
