class PaymentsController < ApplicationController
  def new
    @booking = current_user.booking.where(state: 'pending').find(params[:booking_id])
  end
end
