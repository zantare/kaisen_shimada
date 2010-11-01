class AddShopIdToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :shop_id, :integer
  end

  def self.down
    remove_column :products, :shop_id
  end
end
