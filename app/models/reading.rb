class Reading < ApplicationRecord

  belongs_to :grade
  has_many :reading_enrollments , dependent: :destroy
  has_many :students, through: :reading_enrollments

  validates_presence_of :title

  scope :newest_first, lambda { order "created_at DESC" }

end
