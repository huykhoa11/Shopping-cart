class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :product


    before_save :set_unit_price
    before_save :set_total


    def self.csv_attributes
        ["product_id", "unit_price", "quantity", "total", "created_at"]
    end

    def self.generate_csv
        CSV.generate(headers: true) do |csv|
            csv << csv_attributes
            all.each do |order|
                csv << csv_attributes.map{|attr| order.send(attr)}
            end
        end
    end


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
        self[:total] = total  	#total * quantity
    end
end