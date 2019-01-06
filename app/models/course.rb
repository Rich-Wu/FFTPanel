class Course < ApplicationRecord
  has_and_belongs_to_many :cohorts
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :hours, presence: true

end
