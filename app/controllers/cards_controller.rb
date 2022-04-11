class CardsController < ApplicationController
  def show
  	@order_items = current_order.order_items
  	# @order_items = OrderItem.all
  end

end
