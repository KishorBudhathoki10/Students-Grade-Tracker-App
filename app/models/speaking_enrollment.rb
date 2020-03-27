class SpeakingEnrollment < ApplicationRecord
  
  belongs_to :student
  belongs_to :speaking

  validates_presence_of :student_id, :speaking_id

end
