class BookingsController < ApplicationController
  def create
    room = Room.find(params[:room_id])
    booking = Booking.create!(room: room, room_sku: room.sku, amount: room.price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: room.sku,
        images: [room.photo_url],
        amount: room.price_cents,
        currency: 'aud',
        quantity: 1
      }],
      success_url: bookin_url(booking),
      cancel_url: booking_url(booking)
    )

    booking.update(checkout_session_id: session.id)
    redirect_to new_booking_payment_path(booking)
  end
def show
  @booking = current_user.booking.find(params[:id])
end



end
