class ShopController < ApplicationController

  def index
  	@products = Product.all
  	@order_item = current_order.order_items.new 	#tao order_items moi thuoc current order
  end

  def show
  	@product = Product.find(params[:id])
  end

end
