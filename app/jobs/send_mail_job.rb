class SendMailJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.registration_confirmation(user).deliver_later
  end
end
