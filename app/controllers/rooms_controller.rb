class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
end

  private

  def room_params
    params.require(:room).permit(:description, :capacity, :price_cents)
  end
end
