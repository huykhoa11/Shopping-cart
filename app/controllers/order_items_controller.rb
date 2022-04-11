class OrderItemsController < ApplicationController
	before_action :set_order_item, only: [:update, :destroy]	#siêu quan trọng, 
																#trước khi bấm update hay destroy thì chương trình sẽ chạy hàm set_order_item trước

	def create
		@order = current_order
		@order_item = @order.order_items.new(order_params)
		@order.save
		session[:order_id] = @order.id

		respond_to do |format|
			format.js
		end
	end

	def update
		
		@order_item.update(order_params)
		
		respond_to do |format|
			format.js
		end
	end

	def destroy
	  	
	  	@order_item.destroy
	  	
	  	respond_to do |format|
			format.js
		end
  	end

	private
	def set_order_item
		@order_item = current_order.order_items.find(params[:id])
		@order_items = current_order.order_items
	end


	def order_params
		params.require(:order_item).permit(:product_id, :quantity)
	end
end
