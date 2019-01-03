class User < ApplicationRecord
  before_validation :downcase_email
  before_create :default_values

  private
  validates :email, :presence => true, :uniqueness => true

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

  def default_values
    self.avatar ||= "FFT_Red_Chocobo_Portrait.png"
  end
end
