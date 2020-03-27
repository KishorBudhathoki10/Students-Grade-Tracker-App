class ListeningEnrollment < ApplicationRecord

  belongs_to :student
  belongs_to :listening

  validates_presence_of :student_id, :listening_id

end
