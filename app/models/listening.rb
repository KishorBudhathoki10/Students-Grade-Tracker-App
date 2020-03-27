class Listening < ApplicationRecord

  belongs_to :grade
  has_many :listening_enrollments , dependent: :destroy
  has_many :students, through: :listening_enrollments

  validates_presence_of :title

  scope :newest_first, lambda { order "created_at DESC" }

end
