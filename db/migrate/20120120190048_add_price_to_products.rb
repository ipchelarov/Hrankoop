class AddPriceToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.float :price
    end
  end

  def self.down
    change_table :products do |t|
      t.remove :price
    end
  end
end
