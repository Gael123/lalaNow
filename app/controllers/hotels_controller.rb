class HotelsController < ApplicationController
def index
    if params[:query].present?
      @hotels = Hotel.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @hotels = Hotel.geocoded
    end
    # @superheroes = Superhero.geocoded #returns superheroes with coordinates
    # @markers = @superheroes.map do |hero|
    #   {
    #     lat: hero.latitude,
    #     lng: hero.longitude
    #   }
    # end
  end
def show
    @hotel = Hotel.find(params[:id])
    @review = Review.new
    @marker =
      [{
        lat: @hotellatitude,
        lng: @hotel.longitude,
        image_url: helpers.asset_url('map-icon.png')
      }]
  end


end
