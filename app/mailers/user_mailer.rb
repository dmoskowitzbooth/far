class UserMailer < ApplicationMailer
  default from: 'dmoskowitz815@gmail.com'

  def welcome_email
    @user = dmoskowitz815@gmail.com
    @url  = 'http://example.com/login'
    mail(to: 'damoskowitz815@gmail.com', subject: 'Success!')
  end
end
