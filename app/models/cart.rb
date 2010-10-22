class Cart
  def add_product(product)
    item_ids << product.id
  end 

  def items
    item_ids.map{|id| Product.find(id)}
  end

  private
  def item_ids
    @item_ids ||= []
  end
end
