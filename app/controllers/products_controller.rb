class ProductsController < ApplicationController
  before_filter

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where(product_id: @product.id).order(created_at: :desc)
    # @reviews = @product.reviews.order(created_at: :desc)
    @new_review = @product.reviews.build
    # @new_review = @review.new
  end


end
