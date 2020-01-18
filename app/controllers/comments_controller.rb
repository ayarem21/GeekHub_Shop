class CommentsController < ApplicationController
  before_action :find_film

  def index
    @product.comments = @product.comments.arrange(order: :created_at)
  end

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create
    @comment = Product.find(params[:product_id])
    @comment = @product.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to product_path(@product)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :minus, :plus, :rating)
  end

  def find_film
    @product = Product.find(params[:product_id])
  end
end
