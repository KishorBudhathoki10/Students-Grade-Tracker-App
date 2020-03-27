class Writing < ApplicationRecord

  belongs_to :grade
  has_many :writing_enrollments, dependent: :destroy
  has_many :students, through: :writing_enrollments

  validates_presence_of :title

  scope :newest_first, lambda { order "created_at DESC" }

end
