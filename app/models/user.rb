class User < ApplicationRecord
  USERNAME_REGEX = /\A[a-z0-9][[a-z0-9]+[_-]?[a-z0-9]+]{3,11}\z/i
  EMAIL_REGEX = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  has_secure_password
  has_secure_token :auth_token

  before_create :confirmation_token

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       format: { with: User::USERNAME_REGEX }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: User::EMAIL_REGEX }
  validates :password, presence: true,
                       length: { minimum: 6 }, on: :create

  def send_password_reset
    self.password_reset_token = SecureRandom.urlsafe_base64
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def send_email_confirmation
    UserMailer.registration_confirmation(self).deliver
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!
  end

  private

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64 if confirm_token.blank?
  end
end
