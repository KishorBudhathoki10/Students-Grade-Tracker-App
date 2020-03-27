class ReadingEnrollment < ApplicationRecord

  belongs_to :student
  belongs_to :reading

  validates_presence_of :student_id, :reading_id

end
