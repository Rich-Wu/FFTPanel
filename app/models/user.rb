class User < ApplicationRecord
  before_validation :downcase_email
  validates :email, :presence => true, :uniqueness => true

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
