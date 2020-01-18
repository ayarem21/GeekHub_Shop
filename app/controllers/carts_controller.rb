class CartsController < ApplicationController
  before_action :set_cart, except: %i[index]

  def show; end

  def destroy
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

  private

  def set_cart
    @cart = @current_cart
  end
end
