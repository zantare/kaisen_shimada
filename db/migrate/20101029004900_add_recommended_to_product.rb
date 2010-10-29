class AddRecommendedToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :recommended, :boolean, :default => :false
  end

  def self.down
    remove_column :products, :recommended
  end
end
