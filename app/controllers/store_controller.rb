class StoreController < ApplicationController
  before_filter :set_cart

  def index
    @products = Product.for_sale.paginate :page => params[:page], :per_page => 3
  end

  def add_to_cart
    @product = Product.find(params[:id])
    @cart.add_product(@product)
    redirect_to store_path, :notice => "#{@product.name}が買い物カゴに追加されました"
  end

  def empty_cart
    @cart.empty!
    redirect_to store_path, :notice => "買い物カゴは空です"
  end

  def remove_item_from_cart
    product = Product.find(params[:id])
    @cart.remove_product(product)
    redirect_to store_path, :notice => "#{product.name}を買い物カゴから削除しました"
  end

  private
  def set_cart
    @cart = session[:cart] ||= Cart.new
  end
end
