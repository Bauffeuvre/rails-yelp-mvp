class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end
  
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "Object successfully created"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
    
  def show
  @reviews = Review.where(params[:id])
  end
  
  private
  
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
