class Cohort < ApplicationRecord
  has_many :students, class_name: 'User', foreign_key: 'user_id', dependent: :destroy
end
