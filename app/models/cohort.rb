class Cohort < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :course
  scope :students, -> { where(instructor: 0)}
  scope :instructors, -> { where(instructor: 1)}
end
