class BookingsController < ApplicationController

  def new
    @grandma = Grandma.find(params[:grandma_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @grandma = Grandma.find(params[:grandma_id])
    @booking.grandma = @grandma

    if @booking.save!
      redirect_to grandma_booking_path(@grandma, @booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
