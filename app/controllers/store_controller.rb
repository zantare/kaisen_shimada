class StoreController < ApplicationController
  before_filter :set_cart

  def index
    @products = Product.for_sale.paginate :page => params[:page], :per_page => 3
  end

  def suppliers
    @suppliers = Shop.all
  end

  def checkout
    if @cart.nil? || @cart.items.empty?
      redirect_to store_path, :notice => "カートは現在空です"
    end

    @order = Order.new
  end

  def save_order
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart)
    if @order.save
      @cart.empty!
      redirect_to store_path, :notice => "ご注文ありがとうございます!!"
    else
      render checkout_path
    end
  end

  def add_to_cart
    @product = Product.find(params[:id])
    @cart.add_product(@product)
    #redirect_to store_path, :notice => "#{@product.name}が買い物カゴに追加されました"
    respond_to do |format|
      format.js
    end
  end

  def empty_cart
    @cart.empty!
    #redirect_to store_path, :notice => "買い物カゴは空です"
    respond_to do |format|
      format.js
    end
  end

  def remove_item_from_cart
    product = Product.find(params[:id])
    @cart.remove_product(product)
    #redirect_to store_path, :notice => "#{product.name}を買い物カゴから削除しました"
    respond_to do |format|
      format.js
    end
  end

  private
  def set_cart
    @cart = session[:cart] ||= Cart.new
  end
end
