class Grade < ApplicationRecord

  has_many :sections, dependent: :destroy
  accepts_nested_attributes_for :sections,
                                allow_destroy: true, 
                                reject_if: proc { |attr| attr['name'].blank? }

  validates_presence_of :name

  scope :sorted, lambda { order("id ASC") }

end
