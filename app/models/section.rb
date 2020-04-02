class Section < ApplicationRecord

  belongs_to :grade, optional: true
  has_many :students, dependent: :destroy

  validates_presence_of :name

  mount_uploader :thumb_image, SectionUploader

  scope :sorted, lambda { order('id ASC') }

  scope :alphabetically, lambda { order('name ASC') }
  
end
