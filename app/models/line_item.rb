class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def self.from_cart_item(cart_item)
    line_item = self.new
    line_item.product_id = cart_item.product_id
    line_item.quantity = cart_item.quantity
    line_item
  end
end
