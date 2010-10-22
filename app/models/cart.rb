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
