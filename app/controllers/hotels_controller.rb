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
        lng: hotel.longitude,
        infoWindow: { content: render_to_string(partial: "/hotels/map_box", locals: { hotel: hotel }) },
        id: flat.id

      }
    end
  end
def show
    @hotel = Hotel.find(params[:hotel_id])
    @room = Rooms.new
    @marker =
      [{
        lat: @hotel.latitude,
        lng: @hotel.longitude,
        image_url: helpers.asset_url('map-icon.png')
      }]
  end


  def new
    @Hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    @hotel.user = current_user
    if @hotel.save
      redirect_to hotel_path(@hotel)
    else
      render :new
    end
  end

private
def hotel_params
  params.require(:hotel).permit(:name,:address,:latitude,:longitude,:stars)
end

end

