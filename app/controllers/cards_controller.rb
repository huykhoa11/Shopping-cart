class CardsController < ApplicationController
  def show
  	@order_items = current_order.order_items
  	# @order_items = OrderItem.all
  	respond_to do |format|
  		format.html
  		format.csv {send_data @order_items.generate_csv, filename: "orders-#{Time.zone.now.strftime("%Y%m%d%S")}.csv"}
  	end
  end

end
