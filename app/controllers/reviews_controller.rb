class ReviewsController < ApplicationController
  def new
    # Both of these are for the FORM
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    # loading it
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant # review.resto is = instance of a resto # this is giving the restaurant to the review
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      # show the form again
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
