class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end
  
  def create
    # Create the review
    @review = Review.new(reviews_params)
    # Get the restaurant Id
    @restaurant = Restaurant.find(params[:restaurant_id])
    # Set the review TO THE restaurant
    @review.restaurant = @restaurant
    if @review.save
      flash[:success] = "Object successfully created"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end
end
