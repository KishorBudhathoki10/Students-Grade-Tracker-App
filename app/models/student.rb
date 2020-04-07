class Student < ApplicationRecord

  belongs_to :section
  has_many :speaking_enrollments, dependent: :destroy
  has_many :speakings, :through => :speaking_enrollments

  has_many :writing_enrollments, dependent: :destroy
  has_many :writings, :through => :writing_enrollments

  has_many :listening_enrollments, dependent: :destroy
  has_many :listenings, :through => :listening_enrollments

  has_many :reading_enrollments, dependent: :destroy
  has_many :readings, :through => :reading_enrollments

  mount_uploader :profile_image, StudentUploader

  validates_presence_of :name
  
  scope :sorted, lambda { order('id ASC') }
  scope :newest_first, lambda { order('created_at DESC') }
  scope :alphabetically, lambda { order('name ASC') }
end
