class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def order_data()
    @order = params[:order]
    mail(to: @order.email, subject: 'Your deliever have status new')
  end

  def edit_data()
    @order = params[:order]
    mail(to: @order.email, subject: "Edit status to #{@order.status}")
  end
end
