class Cart
  def add_product(product)
    current_item = items.find{|item| item.product_id == product.id}
    if current_item
      current_item.increment_quantity
    else
      items << CartItem.new(product)
    end
  end 

  def remove_product(product)
    items.reject!{|item| item.product_id == product.id}
  end 

  def items
    @items ||= []
  end

  def empty!
    @items = nil
  end

  def total_price
    @items.map(&:price).sum
  end
end
