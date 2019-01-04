class Cohort < ApplicationRecord
  has_and_belongs_to_many :students, class_name: 'User', optional: true
  has_one :instructor, class_name: 'User'
end
