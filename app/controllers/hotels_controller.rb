class HotelsController < ApplicationController
def index
    if params[:query].present?
      @hotels = Hotel.where( "name ILIKE ?", "%#{params[:query]}%")
    else
      @hotels = Hotel.geocoded
    end
    # @superheroes = Superhero.geocoded #returns superheroes with coordinates
    @markers = @hotels.map do |hotel|
      {
        lat: hotel.latitude,
        lng: hotel.longitude
      }
    end
  end
def show
    @hotel = Hotel.find(params[:id])
    @review = Review.new
    @marker =
      [{
        lat: @hotel.latitude,
        lng: @hotel.longitude,
        image_url: helpers.asset_url('map-icon.png')
      }]
  end
private
def hotel_params
  params.require(:hotel).permit(:name,:address,:latitude,:longitude,:stars)
end

end
9
