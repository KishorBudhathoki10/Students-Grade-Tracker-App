class WritingEnrollment < ApplicationRecord

  belongs_to :student
  belongs_to :writing

  validates_presence_of :student_id, :writing_id
  
end
