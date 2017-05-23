class SendResetPasswordMailJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.password_reset(user).deliver_later
  end
end
