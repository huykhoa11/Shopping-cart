class CardsController < ApplicationController
  def show
  	@order_items = current_order.order_items.order(created_at: :desc)
  end

end
