class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt_email(order)
    @order = order
    mail(to: @order.email, subject: 'Your receipt for Jungle order##{@order.id}')
  end
end