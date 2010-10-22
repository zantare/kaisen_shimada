class Cart
  def add_product(product)
    quantities_by_item_id[product.id] += 1
  end 

  def items_with_quantity
    quantities_by_item_id.map do |product_id, quantity|
      [Product.find(product_id), quantity]
    end
  end

  private
  def quantities_by_item_id
    @quantities_by_item_id ||= Hash.new(0)
  end
end
