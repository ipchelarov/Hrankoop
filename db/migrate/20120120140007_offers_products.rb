class OffersProducts < ActiveRecord::Migration
  def self.up
    create_table :offers_products, :id => false do |t|
      t.integer :offer_id
      t.integer :product_id
    end
  end

  def self.down
    drop_table :offers_products
  end
end
