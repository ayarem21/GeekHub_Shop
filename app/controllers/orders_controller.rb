class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new(params[:order])
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@current_cart)
    if @order.save
      @order.user_id = current_user.id
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to root_path
    else
      flash[:alert] = "failed notice here.  View directions."
      redirect_to @order
    end
  end

  private


  def order_params
    params.require(:order).permit(:name, :email, :address, :pay_method, :user_id)
  end
end
