class CartItem
  attr_reader :product_id, :quantity

  def initialize(product)
    @product_id = product.id
    @quantity = 1
  end

  def increment_quantity
    @quantity += 1
  end

  def name
    Product.find(@product_id).name
  end
end

class Cart
  def add_product(product)
    current_item = items.find{|item| item.product_id == product.id}
    if current_item
      current_item.increment_quantity
    else
      items << CartItem.new(product)
    end
  end 

  def items
    @items ||= []
  end
end
