class AgeValidator < ActiveModel::EachValidator
  def validate(record)
    if age(record.birthday) > 150
      record.errors.add(:age, "is too high to enroll")
    end
  end
end

class User < ApplicationRecord
  before_create :default_values
  before_validation :downcase_email, :capitalize_names
  has_and_belongs_to_many :cohorts
  validates :education, inclusion: (1..4)
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, length: { in: 8..32 }
  validates :age, age: true
  scope :students, -> { where(instructor: 0)}
  scope :instructors, -> { where(instructor: 1)}

  def name
    return "#{self.first_name} #{self.last_name}"
  end

  private

  def capitalize_names
    last_name.capitalize!
    first_name.capitalize!
  end

  def downcase_email
    self.email = email.downcase
  end

  def default_values
    self.avatar ||= "FFT_Red_Chocobo_Portrait.png"
  end
end
