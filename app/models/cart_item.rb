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
    product.name
  end

  private
  def product
    Product.find(@product_id)
  end
end


