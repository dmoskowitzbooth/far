class NotifierMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier_mailer.notification_email.subject
  #
  def notification_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
