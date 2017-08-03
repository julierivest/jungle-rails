class ReceiptMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt_email(order)
    @order = order
    puts "email sent"
    mail(to: @order.email, subject: "Order N. #{@order.id}")
  end
end
