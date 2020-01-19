class ProductController < ApplicationController
  before_action :set_product, only: [:show]
  def index
    @products = Product.all.order('created_at DESC').paginate(page: params[:page], per_page: 15)
  end

  def show; end

  def min_price
    @products = Product.order_by_price_min.paginate(page: params[:page], per_page: 15)
    render action: :index
  end

  def max_price
    @products = Product.order_by_price_max.paginate(page: params[:page], per_page: 15)
    render action: :index
  end

  def new_sort
    @products = Product.order_by_new.paginate(page: params[:page], per_page: 15)
    render action: :index
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
