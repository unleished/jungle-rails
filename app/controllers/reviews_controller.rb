class ReviewsController < ApplicationController
  before_filter

  def new
  end

  def create
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews
    @review = Review.new(user_params)
    @review.user_id = current_user.id
    @review.product_id = params[:product_id]
    @new_review = Review.new

    if @review.save
      redirect_to :back
    else
      @error = "error adding your review!"
      render 'products/show'
    end

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to :back
  end

  private

  def user_params
    params.require(:review).permit(
      :description,
      :rating,
    )
  end

end
