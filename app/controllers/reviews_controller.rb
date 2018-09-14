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

  def delete
    raise "yay i'm here!"
  end

  private

  def user_params
    params.require(:review).permit(
      :description,
      :rating,
    )
  end

end
