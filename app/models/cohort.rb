class Cohort < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :courses
  scope :students, -> { where(instructor: 0) }
  scope :instructors, -> { where(instructor: 1) }
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
