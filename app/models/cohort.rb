class Cohort < ApplicationRecord
  has_many :students, class_name: 'User'
  has_one :instructor, class_name: 'User'
end
