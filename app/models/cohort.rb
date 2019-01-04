class Cohort < ApplicationRecord
  has_one :instructor, class_name: 'User'
  has_and_belongs_to_many :students, class_name: 'User'
end
