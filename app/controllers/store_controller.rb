class StoreController < ApplicationController
  def index
    @products = Product.for_sale.paginate :page => params[:page], :per_page => 3
  end

  def add_to_cart
    @product = Product.find(params[:id])
    @cart = current_cart
    @cart.add_product(@product)
  end

  private
  def current_cart
    session[:cart] ||= Cart.new
  end
end
