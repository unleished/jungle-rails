class ReviewsController < ApplicationController
  before_filter

  def new
  end

  def create
    @review = Review.new(user_params)
    @review.user_id = current_user.id
    @review.product_id = params[:product_id]

    if @review.save
      redirect_to :back
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
