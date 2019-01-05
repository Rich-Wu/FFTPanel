class User < ApplicationRecord
  before_create :default_values
  before_validation :downcase_email
  has_and_belongs_to_many :cohorts
  validates :email, :presence => true, :uniqueness => true
  scope :students, -> { where(instructor: 0)}
  scope :instructors, -> { where(instructor: 1)}

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

  def default_values
    self.avatar ||= "FFT_Red_Chocobo_Portrait.png"
  end
end
