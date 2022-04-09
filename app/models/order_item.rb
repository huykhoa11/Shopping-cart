class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :product



    before_save :set_unit_price
    before_save :set_total

    def unit_price
        if persisted?
            self[:unit_price]
        else
            product.price
        end
    end


    def total
        unit_price*quantity
    end


    private

    def set_unit_price
        self[:unit_price] = unit_price 		#self[:unit_price] co the thay doi gia tri cua :unit_price,  
    end										# chu con neu dung self.unit_price thi ko thay doi gia tri dc

    def set_total
        self[:total] = total * quantity
    end
end