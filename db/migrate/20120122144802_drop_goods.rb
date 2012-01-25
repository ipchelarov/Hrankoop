class DropGoods < ActiveRecord::Migration
  def self.up
    drop_table :goods
  end

  def self.down
    create_table :goods do |t|
      t.references :product
      t.float :quantity

      t.timestamps
    end
  end
end
