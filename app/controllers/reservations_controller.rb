class ReservationsController < ApplicationController
   def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = @restaurant.reservation.build(reservation_params)
    @reservation.user_id = current_user.id

    # Check out this article on [.build](http://stackoverflow.com/questions/783584/ruby-on-rails-how-do-i-use-the-active-record-build-method-in-a-belongs-to-rel)
    # You could use a longer alternate syntax if it makes more sense to you
    #
    # @review = Review.new(
    #   :comment    => params[:review][:comment],
    #   :product_id => @product.id,
    #   :user_id    => current_user.id
    # )

    if @reservation.save
      redirect_to reservations_path, notice: 'Reservation created successfully'
    else
      render :action => :show
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  private
  def reservation_params
    params.require(:reservation).permit(:restaurant_id)
  end

  def load_product
    @reservation = Reservation.find(params[:product_id])
  end
end
end
