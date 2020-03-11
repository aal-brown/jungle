class UserMailer < ApplicationMailer

  # I will need to receive the active user database entry in order to get the email address
  default from: 'no-reply@jungle.com'

  def order_email(order, user)
    @order = order
    @user = user
    mail(to: @user.email, subject: "Summary for order")
  end

end
