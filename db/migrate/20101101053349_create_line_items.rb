class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.references :order
      t.references :product
      t.integer :quantity, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :line_items
  end
end
