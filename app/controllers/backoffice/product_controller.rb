class Backoffice::ProductController < BackOfficeController
  before_action :find_product, except: %i[new create index]

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin: @product
      flash[:notice] = 'Product has been added'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update_attributes(product_params)
      redirect_to admin: @product
      flash[:notice] = 'Product has been edited'
    else
      format.html { render :edit }
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: 'Product was successfully destroyed.'
  end

  private

  def find_product
    @product = Product.friendly.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :category_id, :price, images: [])
  end
end
