module ReviewsHelper

  def avg_rating(reviews)
    return "Not Rated" if reviews.length == 0
    reviews.sum(:rating).to_f/reviews.length
  end
end
