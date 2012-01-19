class CreateGoods < ActiveRecord::Migration
  def self.up
    create_table :goods do |t|
      t.references :product
      t.float :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :goods
  end
end
