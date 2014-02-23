class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def add_product(product_id)
		current_item = line_items.find_by(product_id: product_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(product_id: product_id)
		end
		current_item
	end

	def remove_product(product_id)
		current_item = line_items.find_by(product_id: product_id)
		puts current_item.quantity
		current_item.quantity -= 1
		if current_item.quantity == 0
			line_items.delete(current_item)
		else
			current_item.save
		end
	end

	def total_price
		line_items.to_a.sum { |item| item.total_price }
	end
end