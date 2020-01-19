class Backoffice::OrdersController < BackOfficeController
  def index
    @orders = Order.all
  end

  def show
    @orders = Order.all
  end
end
