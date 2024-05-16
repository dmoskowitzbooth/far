class NotifierMailer < ApplicationMailer
  default from: 'dmoskowitz815@gmail.com',
  return_path: 'dmoskowitz815@gmail.com'

def welcome(recipient)
@account = recipient
mail(to: 'dmoskowitz815@gmail.com',
)
end
end
