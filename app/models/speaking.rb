class Speaking < ApplicationRecord

  belongs_to :grade
  has_many :speaking_enrollments, dependent: :destroy
  has_many :students, through: :speaking_enrollments

  validates_presence_of :title

  scope :newest_first, lambda { order "created_at DESC" }

end
