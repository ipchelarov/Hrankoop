class RemProductFromOffer < ActiveRecord::Migration
  def self.up
    change_table :offers do |t|
      t.remove :products
    end
  end

  def self.down
    change_table :offers do |t|
      t.references :products
    end
  end
end
