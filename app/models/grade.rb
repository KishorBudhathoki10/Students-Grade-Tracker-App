class Grade < ApplicationRecord

  has_many :sections, dependent: :destroy
  accepts_nested_attributes_for :sections,
                                allow_destroy: true, 
                                reject_if: proc { |attr| attr['name'].blank? }

  has_many :speakings, dependent: :destroy
  has_many :writings, dependent: :destroy
  has_many :listenings, dependent: :destroy
  has_many :readings, dependent: :destroy

  validates_presence_of :name

  mount_uploader :thumb_image, GradeUploader

  scope :sorted, lambda { order("id ASC") }

end
