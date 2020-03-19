class Student < ApplicationRecord

  belongs_to :section

  validates_presence_of :name,
                        :age,
                        :family_history,
                        :strengths,
                        :weaknesses

  scope :sorted, lambda { order('id ASC') }

end
