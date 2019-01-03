class User < ApplicationRecord
  before_create :default_values
  before_validation :downcase_email
  belongs_to :cohort
  validates :email, :presence => true, :uniqueness => true

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

  def default_values
    self.avatar ||= "FFT_Red_Chocobo_Portrait.png"
    self.cohort_id ||= 1
  end
end
