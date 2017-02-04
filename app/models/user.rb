class User < ApplicationRecord
  USERNAME_REGEX = /\A[a-z0-9][[a-z0-9]+[_-]?[a-z0-9]+]{3,11}\z/i
  EMAIL_REGEX = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  has_secure_password
  has_secure_token :auth_token

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       format: { with: User::USERNAME_REGEX }
  validates :email, presence: true,
                    format: { with: User::EMAIL_REGEX }
end
